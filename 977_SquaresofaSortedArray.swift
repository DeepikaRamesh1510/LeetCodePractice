import Foundation

/*
 977. Squares of a Sorted Array - https://leetcode.com/problems/squares-of-a-sorted-array
 
 Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
 
 Example 1:
 
 Input: nums = [-4,-1,0,3,10]
 Output: [0,1,9,16,100]
 Explanation: After squaring, the array becomes [16,1,0,9,100].
 After sorting, it becomes [0,1,9,16,100].
 Example 2:
 
 Input: nums = [-7,-3,2,3,11]
 Output: [4,9,9,49,121]
 
 
 Constraints:
 
 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in non-decreasing order.
 
 
 Follow up: Squaring each element and sorting the new array is very trivial, could you find an O(n) solution using a different approach?
 */


func sortedSquares(_ nums: [Int]) -> [Int] {
	var result: [Int] = Array(repeating: 0, count: nums.count)
	var left = 0
	var right = nums.count - 1
	var i = nums.count - 1
	
	while i >= 0 {
		var value = 0
		if abs(nums[left]) < abs(nums[right]) {
			value = nums[right]
			right -= 1
		} else {
			value = nums[left]
			left += 1
		}
		result[i] = value * value
		i -= 1
	}
	return result
}


func sortedSquares1(_ nums: [Int]) -> [Int] {
	return nums.map({ $0 * $0 }).sorted()
}

//sortedSquares([-4,-1,0,3,10])
