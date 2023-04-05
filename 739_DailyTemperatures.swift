import Foundation

/*
 739. Daily Temperatures - https://leetcode.com/problems/daily-temperatures/description/
 
 Given an array of integers temperatures represents the daily temperatures, return an array answer such that answer[i] is the number of days you have to wait after the ith day to get a warmer temperature. If there is no future day for which this is possible, keep answer[i] == 0 instead.
 
 
 
 Example 1:
 
 Input: temperatures = [73,74,75,71,69,72,76,73]
 Output: [1,1,4,2,1,1,0,0]
 Example 2:
 
 Input: temperatures = [30,40,50,60]
 Output: [1,1,1,0]
 Example 3:
 
 Input: temperatures = [30,60,90]
 Output: [1,1,0]
 
 
 Constraints:
 
 1 <= temperatures.length <= 105
 30 <= temperatures[i] <= 100
 */

func dailyTemperatures(_ temperatures: [Int]) -> [Int] {
	var stack: [(Int, Int)] = []
	var ans: [Int] = Array(repeating: 0, count: temperatures.count)
	for i in (0..<temperatures.count) {
		if stack.isEmpty {
			stack.append((temperatures[i], i))
			continue
		}
		
		while !stack.isEmpty && stack[stack.count - 1].0 < temperatures[i] {
			let last = stack.removeLast()
			// print("current i: \(i), last index: \(last.1)")
			ans[last.1] = i - last.1
		}
		
		stack.append((temperatures[i], i))
	}
	return ans
}
