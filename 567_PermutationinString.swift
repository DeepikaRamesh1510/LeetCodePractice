import Foundation

/*
 567. Permutation in String - https://leetcode.com/problems/permutation-in-string/description
 
 Given two strings s1 and s2, return true if s2 contains a permutation of s1, or false otherwise.
 
 In other words, return true if one of s1's permutations is the substring of s2.
 
 
 
 Example 1:
 
 Input: s1 = "ab", s2 = "eidbaooo"
 Output: true
 Explanation: s2 contains one permutation of s1 ("ba").
 Example 2:
 
 Input: s1 = "ab", s2 = "eidboaoo"
 Output: false
 
 
 Constraints:
 
 1 <= s1.length, s2.length <= 104
 s1 and s2 consist of lowercase English letters.
 */


func checkInclusion(_ s1: String, _ s2: String) -> Bool {
	if s1.count > s2.count { return false }
	let s1: [Character] = Array(s1)
	let s2: [Character] = Array(s2)
	var s1Map = Array(repeating: 0, count: 26)
	var s2Map = Array(repeating: 0, count: 26)
	
	for i in (0..<s1.count) {
		s1Map[s1[i].number] = s1Map[s1[i].number] + 1
		s2Map[s2[i].number] = s2Map[s2[i].number] + 1
	}
	
	if s1Map == s2Map { return true }
	
	for i in (0..<(s2.count - s1.count)) {
		s2Map[s2[i + s1.count].number] = s2Map[s2[i + s1.count].number] + 1
		s2Map[s2[i].number] = s2Map[s2[i].number] - 1
		if s1Map == s2Map { return true }
	}
	
	return s1Map == s2Map
}

fileprivate extension Character {
	var intAscii: Int {
		return Int(self.asciiValue ?? 0)
	}
	var number: Int {
		return self.intAscii - Character("a").intAscii
	}
}




//checkInclusion("ab", "eidboaooo")
