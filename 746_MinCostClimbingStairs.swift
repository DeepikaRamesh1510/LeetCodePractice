import Foundation

/*
 746. Min Cost Climbing Stairs https://leetcode.com/problems/min-cost-climbing-stairs/

 You are given an integer array cost where cost[i] is the cost of ith step on a staircase. Once you pay the cost, you can either climb one or two steps.
 
 You can either start from the step with index 0, or the step with index 1.
 
 Return the minimum cost to reach the top of the floor.
 
 
 
 Example 1:
 
 Input: cost = [10,15,20]
 Output: 15
 Explanation: You will start at index 1.
 - Pay 15 and climb two steps to reach the top.
 The total cost is 15.
 Example 2:
 
 Input: cost = [1,100,1,1,1,100,1,1,100,1]
 Output: 6
 Explanation: You will start at index 0.
 - Pay 1 and climb two steps to reach index 2.
 - Pay 1 and climb two steps to reach index 4.
 - Pay 1 and climb two steps to reach index 6.
 - Pay 1 and climb one step to reach index 7.
 - Pay 1 and climb two steps to reach index 9.
 - Pay 1 and climb one step to reach the top.
 The total cost is 6.
 */

func minCostClimbingStairs(_ cost: [Int]) -> Int {
	let count = cost.count
	if count == 1 { return cost[0] }
	if count == 2 { return min(cost[0], cost[1])}
	
	var dp: [Int] = Array(repeating: 0, count: count)
	
	dp[0] = cost[0]
	dp[1] = cost[1]
	
	for i in 2..<count {
		dp[i] = cost[i] + min(dp[i-1], dp[i-2])
	}
	return min(dp[count - 1], dp[count - 2])
}


//print(minCostClimbingStairs([10,15,20]))
