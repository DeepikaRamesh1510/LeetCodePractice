import Foundation

/*
 557. Reverse Words in a String III - https://leetcode.com/problems/reverse-words-in-a-string-iii/description/
 
 Given a string s, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.
 
 
 
 Example 1:
 
 Input: s = "Let's take LeetCode contest"
 Output: "s'teL ekat edoCteeL tsetnoc"
 Example 2:
 
 Input: s = "God Ding"
 Output: "doG gniD"
 
 
 Constraints:
 
 1 <= s.length <= 5 * 104
 s contains printable ASCII characters.
 s does not contain any leading or trailing spaces.
 There is at least one word in s.
 All the words in s are separated by a single space.
 */

func reverseWords(_ s: String) -> String {
	var s = Array(s)
	var wordStart = 0
	var wordEnd = 0
	
	while wordEnd < s.count {
		
		while wordEnd < s.count && s[wordEnd] != " " {
			wordEnd += 1
		}
		
		var left = wordStart
		var right = wordEnd - 1
		
		while left < right {
			print(left, right)
			let temp = s[left]
			s[left] = s[right]
			s[right] = temp
			left += 1
			right -= 1
		}
		
		wordEnd += 1
		wordStart = wordEnd
	}
	
	return String(s)
}

func reverseWords1(_ s: String) -> String {
	let words = s.split(separator: " ")
	let reversedWords = words.map { $0.reversed() }
	let result = reversedWords.joined(separator: " ")
	return String(result)
}


//print(reverseWords("Let's take LeetCode contest"))
