import Foundation

/*
 2089. Find Target Indices After Sorting Array
 
 You are given a 0-indexed integer array nums and a target element target.

 A target index is an index i such that nums[i] == target.

 Return a list of the target indices of nums after sorting nums in non-decreasing order. If there are no target indices, return an empty list. The returned list must be sorted in increasing order.

  

 Example 1:

 Input: nums = [1,2,5,2,3], target = 2
 Output: [1,2]
 Explanation: After sorting, nums is [1,2,2,3,5].
 The indices where nums[i] == 2 are 1 and 2.
 */


func targetIndices(_ nums: [Int], _ target: Int) -> [Int] {
    var i = 0
    var indices: [Int] = []
    nums.sorted().forEach {
        if $0 == target {
            indices.append(i)
        }
        i += 1
    }
    return indices
}

func targetIndices2(_ nums: [Int], _ target: Int) -> [Int] {
    var count = 0
    var lessThan = 0
    nums.forEach {
        if $0 == target {
            count += 1
        } else if $0 < target {
            lessThan += 1
        }
    }
    return (0..<count).map { lessThan + $0 }
}
//targetIndices2([1,2,5,2,3], 2)
