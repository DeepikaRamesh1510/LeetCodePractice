import Foundation

/*
 905. Sort Array By Parity
 
 Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.
 
 Return any array that satisfies this condition.
 
 
 
 Example 1:
 
 Input: nums = [3,1,2,4]
 Output: [2,4,3,1]
 Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
 Example 2:
 
 Input: nums = [0]
 Output: [0]
 
 
 Constraints:
 
 1 <= nums.length <= 5000
 0 <= nums[i] <= 5000
 */

func sortArrayByParity1(_ nums: [Int]) -> [Int] {
	return nums.filter { $0 % 2 == 0 } + nums.filter { $0 % 2 != 0 }
}

func sortArrayByParity(_ nums: [Int]) -> [Int] {
	guard nums.count > 1 else { return  nums }
	var nums = nums
	var index = 0
	for i in (0..<nums.count) {
		if nums[i] % 2 == 0 {
			nums.swapAt(index, i)
			index += 1
		}
	}
	
	return nums
}

//print(sortArrayByParity([1,2,3,4]))
