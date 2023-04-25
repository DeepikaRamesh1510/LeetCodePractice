import Foundation

/*
 703. Kth Largest Element in a Stream - https://leetcode.com/problems/kth-largest-element-in-a-stream/description/
 Design a class to find the kth largest element in a stream. Note that it is the kth largest element in the sorted order, not the kth distinct element.
 
 Implement KthLargest class:
 
 KthLargest(int k, int[] nums) Initializes the object with the integer k and the stream of integers nums.
 int add(int val) Appends the integer val to the stream and returns the element representing the kth largest element in the stream.
 
 
 Example 1:
 
 Input
 ["KthLargest", "add", "add", "add", "add", "add"]
 [[3, [4, 5, 8, 2]], [3], [5], [10], [9], [4]]
 Output
 [null, 4, 5, 5, 8, 8]
 
 Explanation
 KthLargest kthLargest = new KthLargest(3, [4, 5, 8, 2]);
 kthLargest.add(3);   // return 4
 kthLargest.add(5);   // return 5
 kthLargest.add(10);  // return 5
 kthLargest.add(9);   // return 8
 kthLargest.add(4);   // return 8
 
 
 Constraints:
 
 1 <= k <= 104
 0 <= nums.length <= 104
 -104 <= nums[i] <= 104
 -104 <= val <= 104
 At most 104 calls will be made to add.
 It is guaranteed that there will be at least k elements in the array when you search for the kth element.
 */


class KthLargest {
	
	var heap: MinHeap<Int> = MinHeap()
	var k: Int
	
	init(_ k: Int, _ nums: [Int]) {
		self.k = k
		for num in nums {
			heap.add(num)
		}
		
		while heap.size > k {
			let value = heap.poll()
			// print("value polled: \(value)")
		}
	}
	
	func add(_ val: Int) -> Int {
		heap.add(val)
		if heap.size > k { heap.poll() }
		// heap.printHeap()
		// print()
		return heap.peek() ?? Int.min
	}
}


struct MinHeap<T: Comparable> {
	var items: [T] = []
	var size: Int { items.count }
	init(_ items: [T] = []) {
		if items.isEmpty { return }
		for num in items {
			self.add(num)
		}
	}
	
	func peek() -> T? {
		return items.first
	}
	
	mutating func poll() -> T? {
		if items.isEmpty { return nil }
		
		let item = items[0]
		items[0] = items.removeLast()
		heapifyDown()
		return item
	}
	
	mutating func add(_ val: T) {
		items.append(val)
		//    print("after adding the val: \(items)")
		heapifyUp()
		//    print("after heapification: \(items)")
	}
	
	func getParentIndex(_ index: Int) -> Int { return (index - 1) / 2 }
	func getLeftChildIndex(_ index: Int) -> Int { return index * 2 + 1 }
	func getRightChildIndex(_ index: Int) -> Int { return index * 2 + 2 }
	
	func hasParent(_ index: Int) -> Bool { return getParentIndex(index) >= 0 }
	func hasLeftChild(_ index: Int) -> Bool { return getLeftChildIndex(index) < items.count }
	func hasRightChild(_ index: Int) -> Bool { return getRightChildIndex(index) < items.count }
	
	func getParent(_ index: Int) -> T { return items[getParentIndex(index)] }
	func getLeftChild(_ index: Int) -> T { return items[getLeftChildIndex(index)] }
	func getRightChild(_ index: Int) -> T { return items[getRightChildIndex(index)] }
	
	mutating func heapifyDown() {
		if items.isEmpty { return }
		var index = 0
		var smallestChildIndex: Int
		
		while hasLeftChild(index) {
			smallestChildIndex = getLeftChildIndex(index)
			if hasRightChild(index) && getRightChild(index) < items[smallestChildIndex] {
				smallestChildIndex = getRightChildIndex(index)
			}
			
			if items[index] < items[smallestChildIndex] { return }
			
			items.swapAt(index, smallestChildIndex)
			index = smallestChildIndex
		}
	}
	
	mutating func heapifyUp() {
		if items.isEmpty { return }
		var index = items.count - 1
		
		// if hasParent(index) {
		//     print("Value of the parent & the current value", getParentIndex(index), index)
		// } else {
		//     print("Has no parents --- \(items[index])")
		// }
		while hasParent(index) && getParent(index) > items[index] {
			items.swapAt(getParentIndex(index), index)
			index = getParentIndex(index)
		}
	}
	
	func printHeap() {
		for i in items {
			print(i, terminator: " ")
		}
	}
}
