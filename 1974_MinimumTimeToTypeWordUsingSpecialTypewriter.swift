import Foundation

/*
 1974. Minimum Time to Type Word Using Special Typewriter - https://leetcode.com/problems/minimum-time-to-type-word-using-special-typewriter/
 
 There is a special typewriter with lowercase English letters 'a' to 'z' arranged in a circle with a pointer. A character can only be typed if the pointer is pointing to that character. The pointer is initially pointing to the character 'a'.
 
 Each second, you may perform one of the following operations:
 
 Move the pointer one character counterclockwise or clockwise.
 Type the character the pointer is currently on.
 Given a string word, return the minimum number of seconds to type out the characters in word.
 
 Example 1:
 
 Input: word = "abc"
 Output: 5
 Explanation:
 The characters are printed as follows:
 - Type the character 'a' in 1 second since the pointer is initially on 'a'.
 - Move the pointer clockwise to 'b' in 1 second.
 - Type the character 'b' in 1 second.
 - Move the pointer clockwise to 'c' in 1 second.
 - Type the character 'c' in 1 second.
 */

class Solution1974 {
	func minTimeToType(_ word: String) -> Int {
		var prevCharValue: Int = 0
		var minSteps: Int = word.count
		for char in word {
			let currentAlphabetPosition = char.alphabetPosition
			let value = abs(currentAlphabetPosition - prevCharValue)
			minSteps += min(value, 26 - value)
			prevCharValue = currentAlphabetPosition
		}
		return minSteps
	}
}

extension Character {
	var alphabetPosition: Int {
		return Int(asciiValue ?? 0) - Int(Character("a").asciiValue ?? 0)
	}
}
