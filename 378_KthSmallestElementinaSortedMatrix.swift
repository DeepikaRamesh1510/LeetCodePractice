import Foundation

/*
 378. Kth Smallest Element in a Sorted Matrix - https://leetcode.com/problems/kth-smallest-element-in-a-sorted-matrix/description/
 Medium
 9K
 316
 company
 Facebook
 company
 Amazon
 company
 Microsoft
 Given an n x n matrix where each of the rows and columns is sorted in ascending order, return the kth smallest element in the matrix.
 
 Note that it is the kth smallest element in the sorted order, not the kth distinct element.
 
 You must find a solution with a memory complexity better than O(n2).
 
 
 
 Example 1:
 
 Input: matrix = [[1,5,9],[10,11,13],[12,13,15]], k = 8
 Output: 13
 Explanation: The elements in the matrix are [1,5,9,10,11,12,13,13,15], and the 8th smallest number is 13
 Example 2:
 
 Input: matrix = [[-5]], k = 1
 Output: -5
 
 
 Constraints:
 
 n == matrix.length == matrix[i].length
 1 <= n <= 300
 -109 <= matrix[i][j] <= 109
 All the rows and columns of matrix are guaranteed to be sorted in non-decreasing order.
 1 <= k <= n2
 
 
 Follow up:
 
 Could you solve the problem with a constant memory (i.e., O(1) memory complexity)?
 Could you solve the problem in O(n) time complexity? The solution may be too advanced for an interview but you may find reading this paper fun.
 */

fileprivate func kthSmallest(_ matrix: [[Int]], _ k: Int) -> Int {
	
	let priorityFunc: ((Int, Int, Int), (Int, Int, Int)) -> Bool = { (lhs: (Int, Int, Int), rhs: (Int, Int, Int)) -> Bool in
		if lhs.0 < rhs.0 {
			return true
		} else if lhs.0 == rhs.0 {
			if lhs.1 < rhs.1 {
				return true
			} else {
				return lhs.2 < rhs.2
			}
		} else {
			return false
		}
	}
	
	lazy var heap: Heap<(Int, Int, Int)> = Heap([],  priorityFunc)
	
	for i in (0..<min(matrix.count, k)) {
		heap.add((matrix[i][0], i, 0))
	}
	
	var element = heap.peek()
	var k = k
	
	while k > 0 {
		// print(heap.items)
		element = heap.poll()
		guard let row = element?.1, let col = element?.2 else { break }
		if col < matrix[row].count - 1 {
			heap.add((matrix[row][col + 1], row, col + 1))
		}
		
		k -= 1
	}
	
	return element?.0 ?? Int.min
}

fileprivate struct Heap<T> {
	var items: [T] = []
	var isNotEmpty: Bool { return !items.isEmpty }
	var count: Int { return items.count }
	
	var priorityFunc: (T, T) -> Bool
	
	init(_ items: [T], _ priorityFunc: @escaping (T, T) -> Bool) {
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
	
	func getParent(_ index: Int) -> T { return items[getParentIndex(index)] }
	func getRightChild(_ index: Int) -> T { return items[getRightChildIndex(index)] }
	func getLefChild(_ index: Int) -> T { return items[getLeftChildIndex(index)] }
	func peek() -> T? { return items.first }
	
	mutating func add(_ item: T) {
		items.append(item)
		// print(items)
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
	
	mutating func heapifyUp() {
		guard isNotEmpty else { return }
		var index = count - 1
		while hasParent(index) && priorityFunc(items[index], getParent(index)) {
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
			// print(items, index, hasRightChild(index), getRightChildIndex(index))
			if hasRightChild(index) && priorityFunc(getRightChild(index), items[childIndex]) {
				childIndex = getRightChildIndex(index)
			}
			// print("child Index: \(childIndex)")
			if priorityFunc(items[index], items[childIndex]) { break }
			
			items.swapAt(index, childIndex)
			index = childIndex
		}
	}
}
