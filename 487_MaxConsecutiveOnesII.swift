import Foundation

/*
 487. Max Consecutive Ones II - https://leetcode.com/problems/max-consecutive-ones-ii/description/
 Given a binary array nums, return the maximum number of consecutive 1's in the array if you can flip at most one 0.
 
 
 
 Example 1:
 
 Input: nums = [1,0,1,1,0]
 Output: 4
 Explanation:
 - If we flip the first zero, nums becomes [1,1,1,1,0] and we have 4 consecutive ones.
 - If we flip the second zero, nums becomes [1,0,1,1,1] and we have 3 consecutive ones.
 The max number of consecutive ones is 4.
 Example 2:
 
 Input: nums = [1,0,1,1,0,1]
 Output: 4
 Explanation:
 - If we flip the first zero, nums becomes [1,1,1,1,0,1] and we have 4 consecutive ones.
 - If we flip the second zero, nums becomes [1,0,1,1,1,1] and we have 4 consecutive ones.
 The max number of consecutive ones is 4.
 
 
 Constraints:
 
 1 <= nums.length <= 105
 nums[i] is either 0 or 1.
 
 
 Follow up: What if the input numbers come in one by one as an infinite stream? In other words, you can't store all numbers coming from the stream as it's too large to hold in memory. Could you solve it efficiently?
 */


func findMaxConsecutiveOnesII(_ nums: [Int]) -> Int {
	var noOfZeros = 0
	var maxCount = 0
	var left = 0
	
	for right in (0..<nums.count) {
		if nums[right] == 0 {
			noOfZeros += 1
		}
		
		
		while noOfZeros == 2 {
			if nums[left] == 0 {
				noOfZeros -= 1
			}
			left += 1
		}
		maxCount = max(maxCount, right - left + 1)
	}
	
	return maxCount
}
