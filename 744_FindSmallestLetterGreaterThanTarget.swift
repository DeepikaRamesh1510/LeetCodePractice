import Foundation

/*
 744. Find Smallest Letter Greater Than Target - https://leetcode.com/problems/find-smallest-letter-greater-than-target

 You are given an array of characters letters that is sorted in non-decreasing order, and a character target. There are at least two different characters in letters.
 
 Return the smallest character in letters that is lexicographically greater than target. If such a character does not exist, return the first character in letters.
 
 
 
 Example 1:
 
 Input: letters = ["c","f","j"], target = "a"
 Output: "c"
 Explanation: The smallest character that is lexicographically greater than 'a' in letters is 'c'.
 Example 2:
 
 Input: letters = ["c","f","j"], target = "c"
 Output: "f"
 Explanation: The smallest character that is lexicographically greater than 'c' in letters is 'f'.
 Example 3:
 
 Input: letters = ["x","x","y","y"], target = "z"
 Output: "x"
 Explanation: There are no characters in letters that is lexicographically greater than 'z' so we return letters[0].
 
 
 Constraints:
 
 2 <= letters.length <= 104
 letters[i] is a lowercase English letter.
 letters is sorted in non-decreasing order.
 letters contains at least two different characters.
 target is a lowercase English letter.
 */

func nextGreatestLetter2(_ letters: [Character], _ target: Character) -> Character {
	var left = 0
	var right = letters.count - 1
	
	while left <= right {
		let mid = (left + right) / 2
		if letters[mid].intValue > target.intValue {
			right = mid - 1
		} else {
			left = mid + 1
		}
	}
	
	return letters[left % letters.count]
}

func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
	var ans = letters[0]
	var left = 0
	var right = letters.count - 1
	
	while left <= right {
		let mid = (left + right) / 2
		if letters[mid].intValue > target.intValue {
			if mid > 0 && letters[mid - 1].intValue < target.intValue {
				ans = letters[mid]
				break
			} else {
				right = mid - 1
			}
		} else {
			if mid < (letters.count - 1) && letters[mid + 1].intValue > target.intValue {
				ans = letters[mid + 1]
				break
			} else {
				left = mid + 1
			}
		}
	}
	
	return ans
}

fileprivate extension Character {
	var intValue: Int {
		Int(self.asciiValue ?? 0)
	}
}


//nextGreatestLetter(["c", "c" ,"g","g"], "g")
