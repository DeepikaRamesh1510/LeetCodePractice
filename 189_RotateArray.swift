import Foundation

/*
 189. Rotate Array - https://leetcode.com/problems/rotate-array
 
 Given an integer array nums, rotate the array to the right by k steps, where k is non-negative.
 
 
 
 Example 1:
 
 Input: nums = [1,2,3,4,5,6,7], k = 3
 Output: [5,6,7,1,2,3,4]
 Explanation:
 rotate 1 steps to the right: [7,1,2,3,4,5,6]
 rotate 2 steps to the right: [6,7,1,2,3,4,5]
 rotate 3 steps to the right: [5,6,7,1,2,3,4]
 Example 2:
 
 Input: nums = [-1,-100,3,99], k = 2
 Output: [3,99,-1,-100]
 Explanation:
 rotate 1 steps to the right: [99,-1,-100,3]
 rotate 2 steps to the right: [3,99,-1,-100]
 
 
 Constraints:
 
 1 <= nums.length <= 105
 -231 <= nums[i] <= 231 - 1
 0 <= k <= 105
 
 
 Follow up:
 
 Try to come up with as many solutions as you can. There are at least three different ways to solve this problem.
 Could you do it in-place with O(1) extra space?
 */

func rotate3(_ nums: inout [Int], _ k: Int) {
	
	if k % nums.count == 0 { return }
	nums = Array(nums[(nums.count - (k % nums.count))...(nums.count - 1)] + nums[0...((nums.count - 1) - (k % nums.count))])
}

func rotate2(_ nums: inout [Int], _ k: Int) {
	
	if k % nums.count == 0 { return }
	
	var index = 0
	while index < k {
		let value = nums.remove(at: nums.count - 1)
		nums.insert(value, at: 0)
		index += 1
	}
}

func rotate1(_ nums: inout [Int], _ k: Int) {
	
	if k % nums.count == 0 { return }
	
	var ans: [Int] = []
	
	var pointer1 = nums.count - (k % nums.count)
	let pointer2 = pointer1
	
	while pointer1 < nums.count {
		print(pointer1)
		ans.append(nums[pointer1])
		pointer1 += 1
	}
	
	pointer1 = 0
	
	while pointer1 < pointer2 {
		print(pointer1)
		ans.append(nums[pointer1])
		pointer1 += 1
	}
	
	nums = ans
}

//var num = [1,2,3,4,5,6,7]
//
//rotate(&num, 3)
//
//print(num)
