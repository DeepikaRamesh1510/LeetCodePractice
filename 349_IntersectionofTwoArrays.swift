import Foundation

/*
 349. Intersection of Two Arrays - https://leetcode.com/problems/intersection-of-two-arrays/

 Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must be unique and you may return the result in any order.
 
 
 
 Example 1:
 
 Input: nums1 = [1,2,2,1], nums2 = [2,2]
 Output: [2]
 Example 2:
 
 Input: nums1 = [4,9,5], nums2 = [9,4,9,8,4]
 Output: [9,4]
 Explanation: [4,9] is also accepted.
 
 
 Constraints:
 
 1 <= nums1.length, nums2.length <= 1000
 0 <= nums1[i], nums2[i] <= 1000
 */

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
	let nums1Set = Set(nums1)
	
	var ans: Set<Int> = []
	
	for num in nums2 where nums1Set.contains(num) && !ans.contains(num) {
		ans.insert(num)
	}
	
	return Array(ans)
}

func intersection1(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
	let sortedArray = nums1.sorted()
	var ans: Set<Int> = []
	
	for target in nums2 {
		var left = 0
		var right = sortedArray.count - 1
		
		while left <= right {
			let mid = (left + right) / 2
			if sortedArray[mid] == target {
				ans.insert(target)
				break
			} else if sortedArray[mid] < target {
				left = mid + 1
			} else {
				right = mid - 1
			}
		}
	}
	
	return Array(ans)
}


//intersection([4,9,5], [9,4,9,8,4])
