import Foundation

/*
 215. Kth Largest Element in an Array - https://leetcode.com/problems/kth-largest-element-in-an-array/description/
 Given an integer array nums and an integer k, return the kth largest element in the array.
 
 Note that it is the kth largest element in the sorted order, not the kth distinct element.
 
 You must solve it in O(n) time complexity.
 
 
 
 Example 1:
 
 Input: nums = [3,2,1,5,6,4], k = 2
 Output: 5
 Example 2:
 
 Input: nums = [3,2,3,1,2,4,5,5,6], k = 4
 Output: 4
 
 
 Constraints:
 
 1 <= k <= nums.length <= 105
 -104 <= nums[i] <= 104
 */


func partition(_ nums: inout [Int], _ left: Int, _ right: Int, _ pivotIndex: Int) -> Int {
	let pivot = nums[pivotIndex]
	(nums[right], nums[pivotIndex]) = (nums[pivotIndex], nums[right])
	
	var actualIndex = left
	
	for i in (left..<right) {
		if nums[i] < pivot {
			(nums[actualIndex], nums[i]) = (nums[i], nums[actualIndex])
			actualIndex += 1
		}
	}
	(nums[actualIndex], nums[right]) = (nums[right], nums[actualIndex])
	return actualIndex
}

func quickSelect(_ nums: inout [Int], _ left: Int, _ right: Int, _ kSmallest: Int) -> Int {
	if left == right { return nums[left] }
	
	var pivotIndex = left + Int.random(in: 0..<(right - left))
	pivotIndex = partition(&nums, left, right, pivotIndex)
	
	if kSmallest == pivotIndex {
		return nums[kSmallest]
	} else if kSmallest < pivotIndex {
		return quickSelect(&nums, left, pivotIndex - 1, kSmallest)
	} else {
		return quickSelect(&nums, pivotIndex + 1, right, kSmallest)
	}
}

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
	var nums = nums
	return quickSelect(&nums, 0, nums.count - 1, nums.count - k)
}



func findKthLargestSwiftSolution(_ nums: [Int], _ k: Int) -> Int {
	return nums.sorted(by: {$0 > $1 })[k - 1]
}
