import Foundation

/*
 448. Find All Numbers Disappeared in an Array - https://leetcode.com/problems/find-all-numbers-disappeared-in-an-array/description/
 Given an array nums of n integers where nums[i] is in the range [1, n], return an array of all the integers in the range [1, n] that do not appear in nums.
 
 
 
 Example 1:
 
 Input: nums = [4,3,2,7,8,2,3,1]
 Output: [5,6]
 Example 2:
 
 Input: nums = [1,1]
 Output: [2]
 
 
 Constraints:
 
 n == nums.length
 1 <= n <= 105
 1 <= nums[i] <= n
 
 
 Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
 */


func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
	
	// Approach - 2
	return Array(Set(1...nums.count).subtracting(Set(nums)))
	
	//Approach - 1
	
	// var nums2: [Bool] = Array(repeating: false, count: nums.count)
	
	// for num in nums {
	//     if num <= nums.count {
	//         nums2[num - 1] = true
	//     } else {
	//         continue
	//     }
	// }
	
	// var result: [Int] = []
	
	// for i in (0..<nums.count) {
	//     if !nums2[i] {
	//         result.append(i + 1)
	//     }
	// }
	
	// return result
}
