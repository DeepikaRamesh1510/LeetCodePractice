import Foundation

/*
 283. Move Zeroes - https://leetcode.com/problems/move-zeroes
 
 Given an integer array nums, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
 
 Note that you must do this in-place without making a copy of the array.
 
 
 
 Example 1:
 
 Input: nums = [0,1,0,3,12]
 Output: [1,3,12,0,0]
 Example 2:
 
 Input: nums = [0]
 Output: [0]
 
 
 Constraints:
 
 1 <= nums.length <= 104
 -231 <= nums[i] <= 231 - 1
 
 
 Follow up: Could you minimize the total number of operations done?
 */

func moveZeroes(_ nums: inout [Int]) {
	var lastNonZeroIndex = 0
	
	for i in nums {
		if i != 0 {
			nums[lastNonZeroIndex] = i
			lastNonZeroIndex += 1
		}
	}
	
	for i in (lastNonZeroIndex..<nums.count) {
		nums[i] = 0
	}
}

func moveZeroes1(_ nums: inout [Int]) {
	
	let initialCount = nums.count
	var index = 0
	while index < nums.count {
		print(index)
		if nums[index] == 0 {
			nums.remove(at: index)
		} else {
			index += 1
		}
	}
	
	nums = nums + Array(repeating: 0, count: initialCount - nums.count)
}

//var nums = [0,2,1,0,1]
//
//moveZeroes(&nums)
//
//print(nums)
