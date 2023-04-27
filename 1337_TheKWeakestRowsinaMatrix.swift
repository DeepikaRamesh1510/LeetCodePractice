import Foundation

/*
 1337. The K Weakest Rows in a Matrix - https://leetcode.com/problems/the-k-weakest-rows-in-a-matrix/description/
 You are given an m x n binary matrix mat of 1's (representing soldiers) and 0's (representing civilians). The soldiers are positioned in front of the civilians. That is, all the 1's will appear to the left of all the 0's in each row.
 
 A row i is weaker than a row j if one of the following is true:
 
 The number of soldiers in row i is less than the number of soldiers in row j.
 Both rows have the same number of soldiers and i < j.
 Return the indices of the k weakest rows in the matrix ordered from weakest to strongest.
 
 
 
 Example 1:
 
 Input: mat =
 [[1,1,0,0,0],
 [1,1,1,1,0],
 [1,0,0,0,0],
 [1,1,0,0,0],
 [1,1,1,1,1]],
 k = 3
 Output: [2,0,3]
 Explanation:
 The number of soldiers in each row is:
 - Row 0: 2
 - Row 1: 4
 - Row 2: 1
 - Row 3: 2
 - Row 4: 5
 The rows ordered from weakest to strongest are [2,0,3,1,4].
 Example 2:
 
 Input: mat =
 [[1,0,0,0],
 [1,1,1,1],
 [1,0,0,0],
 [1,0,0,0]],
 k = 2
 Output: [0,2]
 Explanation:
 The number of soldiers in each row is:
 - Row 0: 1
 - Row 1: 4
 - Row 2: 1
 - Row 3: 1
 The rows ordered from weakest to strongest are [0,2,3,1].
 
 
 Constraints:
 
 m == mat.length
 n == mat[i].length
 2 <= n, m <= 100
 1 <= k <= m
 matrix[i][j] is either 0 or 1.
 */


//Binary search + heap

func kWeakestRowsWithBSH(_ mat: [[Int]], _ k: Int) -> [Int] {
	// var items: [(Int, Int)] = []
	var heap = WeekestMinHeap([])
	
	for i in (0..<mat.count) {
		var left = 0
		var right = mat[i].count - 1
		while left <= right {
			let mid = (left + right) / 2
			if mat[i][mid] == 1 {
				left = mid + 1
			} else {
				right = mid - 1
			}
		}
		
		heap.add((right, i))
	}
	
	
	
	var result: [Int] = []
	// print(items.count , k)
	for _ in (0..<k) {
		guard let value = heap.poll() else { break }
		result.append(value.1)
	}
	
	return result
}

// linear + heap
func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
	var items: [(Int, Int)] = []
	
	for i in (0..<mat.count) {
		var count = 0
		while count < mat[i].count {
			if mat[i][count] == 1 {
				count += 1
			} else {
				break
			}
		}
		
		items.append((count, i))
	}
	
	var heap = WeekestMinHeap(items)
	
	var result: [Int] = []
	// print(items.count , k)
	for _ in (0..<k) {
		guard let value = heap.poll() else { break }
		result.append(value.1)
	}
	
	return result
}

struct WeekestMinHeap {
	private var items: [(Int, Int)] = []
	var count: Int { return items.count }
	var isEmpty: Bool { return items.isEmpty }
	
	init(_ items: [(Int, Int)]) {
		for i in items {
			self.add(i)
		}
	}
	
	private func getParentIndex(_ index: Int) -> Int { return (index - 1) / 2 }
	private func getLeftChildIndex(_ index: Int) -> Int { return index * 2 + 1 }
	private func getRightChildIndex(_ index: Int) -> Int { return index * 2 + 2 }
	
	private func hasParent(_ index: Int) -> Bool { return getParentIndex(index) >= 0 }
	private func hasRightChild(_ index: Int) -> Bool { return getRightChildIndex(index) < count }
	private func hasLeftChild(_ index: Int) -> Bool { return getLeftChildIndex(index) < count }
	
	private func getParent(_ index: Int) -> (Int, Int) { return items[getParentIndex(index)] }
	private func getLeftChild(_ index: Int) -> (Int, Int) { return items[getLeftChildIndex(index)] }
	private func getRightChild(_ index: Int) -> (Int, Int) { return items[getRightChildIndex(index)]}
	mutating func add(_ item: (Int, Int)) {
		items.append(item)
		heapifyUp()
	}
	
	
	mutating func poll() -> (Int, Int)? {
		guard !isEmpty else { return nil }
		let item = items[0]
		if items.count == 1 {
			return items.removeLast()
		} else {
			items[0] = items.removeLast()
			heapifyDown()
			return  item
		}
		
	}
	
	mutating func heapifyDown() {
		// print("entered heapify down")
		guard !isEmpty else { return }
		var index = 0
		var childIndex: Int
		
		while hasLeftChild(index) {
			childIndex = getLeftChildIndex(index)
			
			if hasRightChild(index) && isGreator(items[childIndex], getRightChild(index)) {
				childIndex = getRightChildIndex(index)
			}
			
			if isGreator(items[childIndex], items[index]) { break }
			
			items.swapAt(index, childIndex)
			index = childIndex
		}
	}
	
	
	mutating func heapifyUp() {
		guard !isEmpty else { return }
		var index = count - 1
		
		while hasParent(index) {
			let parent = getParent(index)
			let parentIndex = getParentIndex(index)
			if isGreator(parent, items[index]) {
				items.swapAt(index, parentIndex)
				index = parentIndex
			} else {
				break
			}
		}
	}
	
	func isGreator(_ lhs: (Int, Int), _ rhs: (Int, Int)) -> Bool {
		
		if lhs.0 > rhs.0 || (lhs.0 == rhs.0 && lhs.1 > rhs.1) {
			return true
		} else {
			return false
		}
	}
	}
