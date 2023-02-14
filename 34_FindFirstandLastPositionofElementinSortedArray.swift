import Foundation

/*
 34. Find First and Last Position of Element in Sorted Array - https://leetcode.com/problems/find-first-and-last-position-of-element-in-sorted-array/description/
 
 Given an array of integers nums sorted in non-decreasing order, find the starting and ending position of a given target value.
 
 If target is not found in the array, return [-1, -1].
 
 You must write an algorithm with O(log n) runtime complexity.
 
 
 
 Example 1:
 
 Input: nums = [5,7,7,8,8,10], target = 8
 Output: [3,4]
 Example 2:
 
 Input: nums = [5,7,7,8,8,10], target = 6
 Output: [-1,-1]
 Example 3:
 
 Input: nums = [], target = 0
 Output: [-1,-1]
 
 
 Constraints:
 
 0 <= nums.length <= 105
 -109 <= nums[i] <= 109
 nums is a non-decreasing array.
 -109 <= target <= 109
 */

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
	var left = 0
	var right = nums.count - 1
	
	var start = -1
	var end = -1
	
	while left <= right && start == -1 {
		let mid = (left + right) / 2
		
		if nums[mid] == target {
			if mid == 0 || nums[mid - 1] < target {
				start = mid
			} else {
				right = mid - 1
			}
			
		} else if nums[mid] < target {
			left = mid + 1
		} else {
			right = mid - 1
		}
		
	}
	
	guard start > -1 else { return [-1, -1] }
	
	left = start
	right = nums.count - 1
	
	while left <= right && end == -1 {
		let mid = (left + right) / 2
		
		if nums[mid] == target {
			if mid == nums.count - 1 || nums[mid + 1] > target {
				end = mid
			} else {
				left = mid + 1
			}
			
		} else if nums[mid] < target {
			left = mid + 1
		} else {
			right = mid - 1
		}
		
	}
	
	return [start, end]
}

//searchRange([10], 10)
