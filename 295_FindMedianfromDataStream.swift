import Foundation

/*
 295. Find Median from Data Stream - https://leetcode.com/problems/find-median-from-data-stream/description/
 The median is the middle value in an ordered integer list. If the size of the list is even, there is no middle value, and the median is the mean of the two middle values.
 
 For example, for arr = [2,3,4], the median is 3.
 For example, for arr = [2,3], the median is (2 + 3) / 2 = 2.5.
 Implement the MedianFinder class:
 
 MedianFinder() initializes the MedianFinder object.
 void addNum(int num) adds the integer num from the data stream to the data structure.
 double findMedian() returns the median of all elements so far. Answers within 10-5 of the actual answer will be accepted.
 
 
 Example 1:
 
 Input
 ["MedianFinder", "addNum", "addNum", "findMedian", "addNum", "findMedian"]
 [[], [1], [2], [], [3], []]
 Output
 [null, null, null, 1.5, null, 2.0]
 
 Explanation
 MedianFinder medianFinder = new MedianFinder();
 medianFinder.addNum(1);    // arr = [1]
 medianFinder.addNum(2);    // arr = [1, 2]
 medianFinder.findMedian(); // return 1.5 (i.e., (1 + 2) / 2)
 medianFinder.addNum(3);    // arr[1, 2, 3]
 medianFinder.findMedian(); // return 2.0
 
 
 Constraints:
 
 -105 <= num <= 105
 There will be at least one element in the data structure before calling findMedian.
 At most 5 * 104 calls will be made to addNum and findMedian.
 
 
 Follow up:
 
 If all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
 If 99% of all integer numbers from the stream are in the range [0, 100], how would you optimize your solution?
 */

class MedianFinder {
	var hiHeap = Heap([], <)
	var loHeap = Heap([], >)
	
	init() {
		
	}
	
	func addNum(_ num: Int) {
		loHeap.add(num)
		if let value = loHeap.poll() {
			hiHeap.add(value)
		}
		
		if loHeap.count < hiHeap.count, let value = hiHeap.poll() {
			loHeap.add(value)
		}
		
	}
	
	func findMedian() -> Double {
		if (loHeap.count + hiHeap.count) % 2 == 0, let first = loHeap.peek(), let second = hiHeap.peek() {
			return Double(first + second) / 2.0
		} else {
			return Double(loHeap.peek() ?? 0) ?? 0.0
		}
	}
	
	struct Heap {
		var items: [Int] = []
		var count: Int { return items.count }
		var isNotEmpty: Bool { return !items.isEmpty }
		var priorityFunc: (Int, Int) -> Bool
		
		init(_ items: [Int], _ priorityFunc: @escaping (Int, Int) -> Bool) {
			self.priorityFunc = priorityFunc
			for i in items {
				self.add(i)
			}
		}
		
		func getParentIndex(_ index: Int) -> Int { return (index - 1) / 2 }
		func getLeftChildIndex(_ index: Int) -> Int { return index * 2 + 1 }
		func getRightChildIndex(_ index: Int) -> Int { return index * 2 + 2 }
		
		func hasParent(_ index: Int) -> Bool { return getParentIndex(index) >= 0 }
		func hasLeftChild(_ index: Int) -> Bool { return getLeftChildIndex(index) < count }
		func hasRightChild(_ index: Int) -> Bool { return getRightChildIndex(index) < count }
		
		func getParent(_ index: Int) -> Int { return items[getParentIndex(index)]}
		func getLeftChild(_ index: Int) -> Int { return items[getLeftChildIndex(index)]}
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
		
		mutating func heapifyUp() {
			guard isNotEmpty else { return }
			var index = count - 1
			while hasParent(index) && priorityFunc(items[index],getParent(index)) {
				let parentIndex = getParentIndex(index)
				items.swapAt(parentIndex, index)
				index = parentIndex
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
				
				if priorityFunc(items[index], items[childIndex]) { return }
				
				items.swapAt(index, childIndex)
				index = childIndex
			}
		}
	}
}
