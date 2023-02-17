import Foundation
import Darwin

/*
 702. Search in a Sorted Array of Unknown Size - https://leetcode.com/problems/search-in-a-sorted-array-of-unknown-size/description/
 
 This is an interactive problem.
 
 You have a sorted array of unique elements and an unknown size. You do not have an access to the array but you can use the ArrayReader interface to access it. You can call ArrayReader.get(i) that:
 
 returns the value at the ith index (0-indexed) of the secret array (i.e., secret[i]), or
 returns 231 - 1 if the i is out of the boundary of the array.
 You are also given an integer target.
 
 Return the index k of the hidden array where secret[k] == target or return -1 otherwise.
 
 You must write an algorithm with O(log n) runtime complexity.
 
 
 
 Example 1:
 
 Input: secret = [-1,0,3,5,9,12], target = 9
 Output: 4
 Explanation: 9 exists in secret and its index is 4.
 Example 2:
 
 Input: secret = [-1,0,3,5,9,12], target = 2
 Output: -1
 Explanation: 2 does not exist in secret so return -1.
 
 
 Constraints:
 
 1 <= secret.length <= 104
 -104 <= secret[i], target <= 104
 secret is sorted in a strictly increasing order.
 */

infix operator ^^
func ^^(_ value1: Int, _ value2: Int) -> Int {
	let result: Float = pow(Float(value1), Float(value2))
	return Int(result)
}

// optimal solution

func search(_ reader: ArrayReader, _ target: Int) -> Int {
	
	var left = 0
	var right = 1
	
	while reader.get(right) < target {
		left = right
		right *= 2
	}
	
	while left <= right {
		let mid = (left + right) / 2
		let value = reader.get(mid)
		if value == target {
			return mid
		} else if target < value {
			right = mid - 1
		} else {
			left = mid + 1
		}
	}
	
	return -1
}


func search1(_ reader: ArrayReader, _ target: Int) -> Int {
	
	var left = 0
	var right = target - reader.get(0)
	
	while left <= right {
		let mid = (left + right) / 2
		let value = reader.get(mid)
		if value == target {
			return mid
		} else if target < value {
			right = mid - 1
		} else {
			left = mid + 1
		}
	}
	
	return -1
}


/*
 Predefined function
 */
public class ArrayReader {
	public func get(_ index: Int) -> Int {
		let secret = [-1,0,3,5,9,12]
		return index < secret.count ? secret[index] : 2 ^^ 31
	}
}

print(search(ArrayReader(), 10000))
