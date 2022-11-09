import Foundation

/*
 392. Is Subsequence - https://leetcode.com/problems/is-subsequence/
 
 Given two strings s and t, return true if s is a subsequence of t, or false otherwise.
 
 A subsequence of a string is a new string that is formed from the original string by deleting some (can be none) of the characters without disturbing the relative positions of the remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).
 
 
 Example 1:
 
 Input: s = "abc", t = "ahbgdc"
 Output: true
 Example 2:
 
 Input: s = "axc", t = "ahbgdc"
 Output: false
 */
func isSubsequence1(_ s: String, _ t: String) -> Bool {
	guard s.count != 0 else { return true }
	guard t.count != 0, s.count < t.count else { return false }
	guard s != t else { return true }
	
	var i = 0
	var j = 0
	while i < s.count && j < t.count {
		if s[i] == t[j] { i += 1 }
		j += 1
	}
	return i == s.count
}

fileprivate extension StringProtocol {
	subscript(offset: Int) -> Character {
		self[index(startIndex, offsetBy: offset)]
	}
}


//MARK: - This solution is faster than the previous one

func isSubsequence2(_ s: String, _ t: String) -> Bool {
	guard s.count != 0 else { return true }
	guard t.count != 0, s.count < t.count else { return false }
	guard s != t else { return true }
	
	let sArray = Array(s)
	let tArray = Array(t)
	var i = 0
	var j = 0
	while i < sArray.count && j < tArray.count {
		if sArray[i] == tArray[j] { i += 1 }
		j += 1
	}
	return i == sArray.count
}

// MARK: - Using divide & conquer along with greedy algorithm

class SubSolution {
	var sourceArray: [Character] = []
	var targetArray: [Character] = []
	
	func isSubsequence(_ s: String, _ t: String) -> Bool {
		guard s.count != 0 else { return true }
		guard t.count != 0, s.count < t.count else { return false }
		guard s != t else { return true }
		sourceArray = Array(s)
		targetArray = Array(t)
		return isSubsequence(0, 0)
	}
	
	func isSubsequence(_ sourceIndex: Int, _ targetIndex: Int) -> Bool {
		if sourceIndex == sourceArray.count { return true }
		if targetIndex == targetArray.count { return false }
		return isSubsequence(sourceArray[sourceIndex] == targetArray[targetIndex] ? sourceIndex + 1 : sourceIndex , targetIndex + 1)
	}
}

// MARK: - Using Dynamic programming

func isSubsequence3(_ s: String, _ t: String) -> Bool {
	guard s.count != 0 else { return true }
	guard t.count != 0, s.count < t.count else { return false }
	guard s != t else { return true }
	let source = Array(s)
	let target = Array(t)
	var dp: [[Int]] = Array(repeatElement(Array(repeatElement(0, count: t.count + 1)), count: s.count + 1))
	
	for col in 1...t.count {
		for row in 1...s.count {
			if source[row - 1] == target[col - 1] {
				dp[row][col] = dp[row - 1][col - 1] + 1
			} else {
				dp[row][col] = max(dp[row - 1][col], dp[row][col - 1])
			}
		}
		
		if dp[source.count][col] == source.count { return true}
	}
	
	return false
}
