import Foundation

/*
 485. Max Consecutive Ones- https://leetcode.com/problems/max-consecutive-ones/description/
 Given a binary array nums, return the maximum number of consecutive 1's in the array.
 
 
 
 Example 1:
 
 Input: nums = [1,1,0,1,1,1]
 Output: 3
 Explanation: The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
 Example 2:
 
 Input: nums = [1,0,1,1,0,1]
 Output: 2
 
 
 Constraints:
 
 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 */


func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
	var maxValue: Int = 0
	var count = 0
	for i in (0..<nums.count) {
		if nums[i] == 1 {
			count += 1
		} else {
			maxValue = max(maxValue, count)
			count = 0
		}
	}
	return max(maxValue, count)
}
