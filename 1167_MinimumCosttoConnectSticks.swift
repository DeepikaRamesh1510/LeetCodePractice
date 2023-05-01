import Foundation

/*
 1167. Minimum Cost to Connect Sticks - https://leetcode.com/problems/minimum-cost-to-connect-sticks/description/
 You have some number of sticks with positive integer lengths. These lengths are given as an array sticks, where sticks[i] is the length of the ith stick.
 
 You can connect any two sticks of lengths x and y into one stick by paying a cost of x + y. You must connect all the sticks until there is only one stick remaining.
 
 Return the minimum cost of connecting all the given sticks into one stick in this way.
 
 
 
 Example 1:
 
 Input: sticks = [2,4,3]
 Output: 14
 Explanation: You start with sticks = [2,4,3].
 1. Combine sticks 2 and 3 for a cost of 2 + 3 = 5. Now you have sticks = [5,4].
 2. Combine sticks 5 and 4 for a cost of 5 + 4 = 9. Now you have sticks = [9].
 There is only one stick left, so you are done. The total cost is 5 + 9 = 14.
 Example 2:
 
 Input: sticks = [1,8,3,5]
 Output: 30
 Explanation: You start with sticks = [1,8,3,5].
 1. Combine sticks 1 and 3 for a cost of 1 + 3 = 4. Now you have sticks = [4,8,5].
 2. Combine sticks 4 and 5 for a cost of 4 + 5 = 9. Now you have sticks = [9,8].
 3. Combine sticks 9 and 8 for a cost of 9 + 8 = 17. Now you have sticks = [17].
 There is only one stick left, so you are done. The total cost is 4 + 9 + 17 = 30.
 Example 3:
 
 Input: sticks = [5]
 Output: 0
 Explanation: There is only one stick, so you don't need to do anything. The total cost is 0.
 
 
 Constraints:
 
 1 <= sticks.length <= 104
 1 <= sticks[i] <= 104
 */


func connectSticks(_ sticks: [Int]) -> Int {
	var minHeap = ConnectSticksHeap(sticks)
	var sum = 0
	while minHeap.count > 1 {
		let newValue = minHeap.poll()! + minHeap.poll()!
		sum += newValue
		minHeap.add(newValue)
	}
	
	return sum
}

struct ConnectSticksHeap {
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


// This is much slower

func connectSticksUsingInBuiltSort(_ sticks: [Int]) -> Int {
	var sticks = sticks.sorted(by: > )
	var sum = 0
	while sticks.count > 1 {
		let newValue = sticks.removeLast() + sticks.removeLast()
		sum += newValue
		sticks.append(newValue)
		sticks.sort(by: > )
	}
	
	return sum
}
