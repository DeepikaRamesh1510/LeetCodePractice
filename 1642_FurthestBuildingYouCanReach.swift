import Foundation

/*
 1642. Furthest Building You Can Reach - https://leetcode.com/problems/furthest-building-you-can-reach/description/
 You are given an integer array heights representing the heights of buildings, some bricks, and some ladders.
 
 You start your journey from building 0 and move to the next building by possibly using bricks or ladders.
 
 While moving from building i to building i+1 (0-indexed),
 
 If the current building's height is greater than or equal to the next building's height, you do not need a ladder or bricks.
 If the current building's height is less than the next building's height, you can either use one ladder or (h[i+1] - h[i]) bricks.
 Return the furthest building index (0-indexed) you can reach if you use the given ladders and bricks optimally.
 
 
 
 Example 1:
 
 
 Input: heights = [4,2,7,6,9,14,12], bricks = 5, ladders = 1
 Output: 4
 Explanation: Starting at building 0, you can follow these steps:
 - Go to building 1 without using ladders nor bricks since 4 >= 2.
 - Go to building 2 using 5 bricks. You must use either bricks or ladders because 2 < 7.
 - Go to building 3 without using ladders nor bricks since 7 >= 6.
 - Go to building 4 using your only ladder. You must use either bricks or ladders because 6 < 9.
 It is impossible to go beyond building 4 because you do not have any more bricks or ladders.
 Example 2:
 
 Input: heights = [4,12,2,7,3,18,20,3,19], bricks = 10, ladders = 2
 Output: 7
 Example 3:
 
 Input: heights = [14,3,19,3], bricks = 17, ladders = 0
 Output: 3
 
 
 Constraints:
 
 1 <= heights.length <= 105
 1 <= heights[i] <= 106
 0 <= bricks <= 109
 0 <= ladders <= heights.length
 */


func furthestBuilding(_ heights: [Int], _ bricks: Int, _ ladders: Int) -> Int {
	var minHeap = FurthestMinHeap([])
	var bricks = bricks
	for i in (0..<heights.count - 1) {
		let climb = heights[i+1] - heights[i]
		guard climb > 0 else { continue }
		minHeap.add(climb)
		if minHeap.count <= ladders { continue }
		bricks -= minHeap.poll() ?? 0
		if bricks < 0 {
			return i
		}
	}
	
	return heights.count - 1
}

struct FurthestMinHeap {
	var items: [Int] = []
	var count: Int { return items.count }
	var isNotEmpty: Bool { return !items.isEmpty }
	
	init(_ items: [Int]) {
		for i in items {
			self.add(i)
		}
	}
	
	func getParentIndex(_ index: Int) -> Int { return (index - 1) / 2 }
	func getLeftChildIndex(_ index: Int) -> Int { return index * 2 + 1 }
	func getRightChildIndex(_ index: Int) -> Int { return index * 2 + 2 }
	
	func hasParent(_ index: Int) -> Bool { return getParentIndex(index) >= 0 }
	func hasRightChild(_ index: Int) -> Bool { return getRightChildIndex(index) < count }
	func hasLeftChild(_ index: Int) -> Bool { return getLeftChildIndex(index) < count }
	
	func getParent(_ index: Int) -> Int { return items[getParentIndex(index)] }
	func getLeftChild(_ index: Int) -> Int { return items[getLeftChildIndex(index)] }
	func getRightChild(_ index: Int) -> Int { return items[getRightChildIndex(index)]}
	
	func peek() -> Int? { return items.first }
	
	mutating func add(_ item: Int) {
		items.append(item)
		heapifyUp()
	}
	
	mutating func poll() -> Int? {
		guard isNotEmpty else { return nil }
		if count == 1 {
			return items.removeLast()
		} else {
			let item = items[0]
			items[0] = items.removeLast()
			heapifyDown()
			return item
		}
	}
	
	mutating func heapifyDown() {
		guard isNotEmpty else { return }
		var index = 0
		var childIndex: Int
		
		while hasLeftChild(index) {
			childIndex = getLeftChildIndex(index)
			if hasRightChild(index) && getRightChild(index) < items[childIndex] {
				childIndex = getRightChildIndex(index)
			}
			
			if items[index] < items[childIndex] { break }
			
			items.swapAt(index, childIndex)
			index = childIndex
		}
	}
	
	mutating func heapifyUp() {
		guard isNotEmpty else { return }
		var index = count - 1
		while hasParent(index) && getParent(index) > items[index] {
			let parentIndex = getParentIndex(index)
			items.swapAt(index, parentIndex)
			index = parentIndex
		}
	}
}
