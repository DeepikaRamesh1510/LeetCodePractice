import Foundation

/*
 1137. N-th Tribonacci Number
 
 The Tribonacci sequence Tn is defined as follows:
 
 T0 = 0, T1 = 1, T2 = 1, and Tn+3 = Tn + Tn+1 + Tn+2 for n >= 0.
 
 Given n, return the value of Tn.
 
 Example 1:
 
 Input: n = 4
 Output: 4
 Explanation:
 T_3 = 0 + 1 + 1 = 2
 T_4 = 1 + 1 + 2 = 4
 Example 2:
 
 Input: n = 25
 Output: 1389537
 */

func tribonacci(_ n: Int) -> Int {
	if n == 0 { return 0 }
	if n == 1 { return 1 }
	if n == 2 { return 1 }
	var dp: [Int] = Array(repeating: 0, count: n + 1)
	
	dp[0] = 0
	dp[1] = 1
	dp[2] = 1
	
	for i in 3...n {
		dp[i] = dp[i - 1] + dp[i - 2] + dp[i - 3]
	}
	return dp[n]
}
