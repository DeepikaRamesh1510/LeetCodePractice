import Foundation

/*
 5. Longest Palindromic Substring - https://leetcode.com/problems/longest-palindromic-substring/description/
 Given a string s, return the longest
 palindromic
 
 substring
 in s.
 
 
 
 Example 1:
 
 Input: s = "babad"
 Output: "bab"
 Explanation: "aba" is also a valid answer.
 Example 2:
 
 Input: s = "cbbd"
 Output: "bb"
 
 
 Constraints:
 
 1 <= s.length <= 1000
 s consist of only digits and English letters.
 */


func longestPalindrome(_ s: String) -> String {
	guard s.count > 1 else {return s }
	let chars = Array(s)
	var dp: [[Bool]] = Array(repeating: Array(repeating: false, count: chars.count), count: chars.count)
	var startingIndex = 0
	var max = 1
	//base conditions
	for i in (0..<chars.count) {
		dp[i][i] = true
		if i < chars.count - 1 {
			dp[i][i+1] = chars[i] == chars[i+1]
			if dp[i][i+1], max < 2 {
				max = 2
				startingIndex = i
			}
		}
	}
	
	guard chars.count > 2 else { return String(chars[startingIndex...(startingIndex + max - 1)]) }
	
	for len in (3...chars.count) {
		for start in (0...chars.count - len) {
			let end = start + len - 1
			
			dp[start][end] =  dp[start + 1][end - 1] && chars[start] == chars[end]
			// print(dp[start][end], start, end)
			if dp[start][end], len > max {
				startingIndex = start
				max = len
			}
		}
	}
	
	return String(chars[startingIndex...(startingIndex + max - 1)])
}
