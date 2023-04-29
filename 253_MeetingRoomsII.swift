import Foundation

/*
 253. Meeting Rooms II - https://leetcode.com/problems/meeting-rooms-ii/description/
 Given an array of meeting time intervals intervals where intervals[i] = [starti, endi], return the minimum number of conference rooms required.
 
 
 
 Example 1:
 
 Input: intervals = [[0,30],[5,10],[15,20]]
 Output: 2
 Example 2:
 
 Input: intervals = [[7,10],[2,4]]
 Output: 1
 
 
 Constraints:
 
 1 <= intervals.length <= 104
 0 <= starti < endi <= 106
 */


fileprivate func minMeetingRooms(_ intervals: [[Int]]) -> Int {
	let intervals = intervals.sorted { return $0[0] < $1[0] }
	var heap: Heap<Int> = Heap([], <)
	
	for i in (0..<intervals.count) {
		let interval = intervals[i]
		if let endTime = heap.peek(), endTime <= interval[0] {
			heap.poll()
		}
		heap.add(interval[1])
	}
	
	return heap.count
}

fileprivate struct Heap<T> {
	var items: [T] = []
	var count: Int { return items.count }
	var isNotEmpty: Bool { return !items.isEmpty }
	var priorityFunc: (T, T) -> Bool
	
	init(_ items: [T],_ priorityFunc: @escaping (T, T) -> Bool ) {
		self.priorityFunc = priorityFunc
		for i in items {
			self.add(i)
		}
	}
	
	func getParentIndex(_ index: Int) -> Int { return (index - 1) / 2 }
	func getLeftChildIndex(_ index: Int) -> Int { return index * 2 + 1 }
	func getRightChildIndex(_ index: Int) -> Int { return  index * 2 + 2 }
	
	func hasParent(_ index: Int) -> Bool { return getParentIndex(index) >= 0 }
	func hasLeftChild(_ index: Int) -> Bool { return getLeftChildIndex(index) < count }
	func hasRightChild(_ index: Int) -> Bool { return getRightChildIndex(index) < count }
	
	func getParent(_ index: Int) -> T { return items[getParentIndex(index)] }
	func getLeftChild(_ index: Int) -> T { return items[getLeftChildIndex(index)] }
	func getRightChild(_ index: Int) -> T { return items[getRightChildIndex(index)] }
	
	func peek() -> T? {
		return items.first
	}
	
	mutating func add(_ item: T) {
		items.append(item)
		heapifyUp()
	}
	
	mutating func poll() -> T? {
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
			
			if hasRightChild(index) && priorityFunc(getRightChild(index), items[childIndex]) {
				childIndex = getRightChildIndex(index)
			}
			
			if priorityFunc(items[index], items[childIndex]) { break }
			
			items.swapAt(index, childIndex)
			index = childIndex
		}
	}
	
	mutating func heapifyUp() {
		guard isNotEmpty else { return }
		
		var index = count - 1
		while hasParent(index) && priorityFunc(items[index], getParent(index)) {
			let parentIndex = getParentIndex(index)
			items.swapAt(parentIndex, index)
			index = parentIndex
		}
	}
}
