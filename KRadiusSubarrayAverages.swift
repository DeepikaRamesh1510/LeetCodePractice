import Foundation

/*
 2090. K Radius Subarray Averages
 
 You are given a 0-indexed array nums of n integers, and an integer k.

 The k-radius average for a subarray of nums centered at some index i with the radius k is the average of all elements in nums between the indices i - k and i + k (inclusive). If there are less than k elements before or after the index i, then the k-radius average is -1.

 Build and return an array avgs of length n where avgs[i] is the k-radius average for the subarray centered at index i.

 The average of x elements is the sum of the x elements divided by x, using integer division. The integer division truncates toward zero, which means losing its fractional part.

 For example, the average of four elements 2, 3, 1, and 5 is (2 + 3 + 1 + 5) / 4 = 11 / 4 = 2.75, which truncates to 2.
 
 Input: nums = [7,4,3,9,1,8,5,2,6], k = 3
 Output: [-1,-1,-1,5,4,4,-1,-1,-1]
 */

// Solution - 1
func naiveGetAverages(_ nums: [Int], _ k: Int) -> [Int] {
    guard k != 0 else { return nums }
    guard nums.count >= ( 2 * k) + 1 else {
        return (0..<nums.count).compactMap { _ in return -1 }
    }
    
    var index = 0
    var result: [Int] = []
    while index < nums.count {
        guard index >= k && (nums.count - index) > k else {
            result.append(-1)
            index += 1
            continue
        }
        
        var sum = 0
        for i in ((index - k)...(index + k)) {
           sum += nums[i]
        }
        result.append(sum / (2 * k + 1))
        index += 1
    }
    return result
}

// Solution - 2
func getAverages(_ nums: [Int], _ k: Int) -> [Int] {
    
    var result: [Int] =  Array(repeating: -1, count: nums.count)
    
    guard nums.count >= (2*k+1) else {
        return result
    }
    
    var preSum: [Int] = [nums[0]]
    for i in (1..<nums.count) {
        preSum.append(preSum[i-1] + nums[i])
    }
    
    for i in (k..<(nums.count - k)) {
        result[i] = (preSum[i+k] - (i-k-1 < 0 ? 0 : preSum[i-k-1])) / (2*k+1)
    }

    return result
}

//getAverages([7,4,3,9,1,8,5,2,6], 3)
