import Foundation

/*
 2531. Make Number of Distinct Characters Equal - https://leetcode.com/problems/make-number-of-distinct-characters-equal/description/
 You are given two 0-indexed strings word1 and word2.
 
 A move consists of choosing two indices i and j such that 0 <= i < word1.length and 0 <= j < word2.length and swapping word1[i] with word2[j].
 
 Return true if it is possible to get the number of distinct characters in word1 and word2 to be equal with exactly one move. Return false otherwise.
 
 
 
 Example 1:
 
 Input: word1 = "ac", word2 = "b"
 Output: false
 Explanation: Any pair of swaps would yield two distinct characters in the first string, and one in the second string.
 Example 2:
 
 Input: word1 = "abcc", word2 = "aab"
 Output: true
 Explanation: We swap index 2 of the first string with index 0 of the second string. The resulting strings are word1 = "abac" and word2 = "cab", which both have 3 distinct characters.
 Example 3:
 
 Input: word1 = "abcde", word2 = "fghij"
 Output: true
 Explanation: Both resulting strings will have 5 distinct characters, regardless of which indices we swap.
 
 
 Constraints:
 
 1 <= word1.length, word2.length <= 105
 word1 and word2 consist of only lowercase English letters.
 */


func isItPossible(_ word1: String, _ word2: String) -> Bool {
	var array1: [Int] = convertStringToNumArray(word1)
	var array2: [Int] = convertStringToNumArray(word2)
	
	for i in (0..<26) where array1[i] > 0 {
		for j in (0..<26) where array2[j] > 0 {
			array1[i] -= 1
			array2[i] += 1
			array1[j] += 1
			array2[j] -= 1
			
			if getNumOfDistinctChars(array1) == getNumOfDistinctChars(array2) { return true }
			
			array1[i] += 1
			array2[i] -= 1
			array1[j] -= 1
			array2[j] += 1
		}
	}
	
	return false
}

func getNumOfDistinctChars(_ array: [Int]) -> Int {
	var count = 0
	for index in (0..<26) where array[index] > 0 {
		count += 1
	}
	return count
}

func convertStringToNumArray(_ string: String) -> [Int] {
	let chars = Array(string)
	var result: [Int] = Array(repeating: 0, count: 26)
	for char in chars {
		result[char.num] += 1
	}
	
	return result
}


extension Character {
	var asciiValueInt: Int {
		return Int(self.asciiValue ?? 0)
	}
	var num: Int {
		return self.asciiValueInt - Character("a").asciiValueInt
	}
}
