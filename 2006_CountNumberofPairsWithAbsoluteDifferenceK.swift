import Foundation

/*
 2006. Count Number of Pairs With Absolute Difference K
 
 Given an integer array nums and an integer k, return the number of pairs (i, j) where i < j such that |nums[i] - nums[j]| == k.

 The value of |x| is defined as:

 x if x >= 0.
 -x if x < 0.
  

 Example 1:

 Input: nums = [1,2,2,1], k = 1
 Output: 4
 Explanation: The pairs with an absolute difference of 1 are:
 - [1,2,2,1]
 - [1,2,2,1]
 - [1,2,2,1]
 - [1,2,2,1]
 */

func countKDifference(_ nums: [Int], _ k: Int) -> Int {
    var dict: [Int: Int] = [:]
    nums.forEach { dict[$0] = dict[$0] == nil ? 1 : dict[$0]! + 1 }
    var answer = 0
    
    print(dict.count)
    while dict.count > 1 {
        let current = dict.remove(at: dict.startIndex)
        
        if let value = dict[current.key + k] {
            answer += current.value * value
        }
        
        if let value = dict[current.key - k] {
            answer += current.value * value
        }
    }
    return answer
}

//countKDifference([1,2,2,1], 1)
