import Foundation

/*
 394. Decode String - https://leetcode.com/problems/decode-string/description/
 Given an encoded string, return its decoded string.
 
 The encoding rule is: k[encoded_string], where the encoded_string inside the square brackets is being repeated exactly k times. Note that k is guaranteed to be a positive integer.
 
 You may assume that the input string is always valid; there are no extra white spaces, square brackets are well-formed, etc. Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there will not be input like 3a or 2[4].
 
 The test cases are generated so that the length of the output will never exceed 105.
 
 
 
 Example 1:
 
 Input: s = "3[a]2[bc]"
 Output: "aaabcbc"
 Example 2:
 
 Input: s = "3[a2[c]]"
 Output: "accaccacc"
 Example 3:
 
 Input: s = "2[abc]3[cd]ef"
 Output: "abcabccdcdcdef"
 
 
 Constraints:
 
 1 <= s.length <= 30
 s consists of lowercase English letters, digits, and square brackets '[]'.
 s is guaranteed to be a valid input.
 All the integers in s are in the range [1, 300].
 */


func decodeString(_ s: String) -> String {
	var chars: [Character] = Array(s)
	var stack: [String] = []
	
	while !chars.isEmpty {
		let char = chars.removeFirst()
		if char != "]" {
			stack.append(String(char))
		} else {
			var subString = ""
			while stack.last != "[" {
				subString = stack.removeLast() + subString
			}
			stack.removeLast()
			var numString = ""
			while !stack.isEmpty && Int(stack.last!) != nil {
				numString = stack.removeLast() + numString
			}
			
			if !numString.isEmpty { stack.append(numString)}
			if let num = Int(stack.removeLast()) {
				var string = ""
				for _ in (0..<num) {
					string = subString + string
				}
				stack.append(string)
			}
		}
	}
	
	var result = ""
	while !stack.isEmpty {
		result = stack.removeLast() + result
	}
	return result
}
