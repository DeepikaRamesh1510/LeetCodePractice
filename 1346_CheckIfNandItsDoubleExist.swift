import Foundation

/*
 1346. Check If N and Its Double Exist - https://leetcode.com/problems/check-if-n-and-its-double-exist/description/
 Given an array arr of integers, check if there exist two indices i and j such that :
 
 i != j
 0 <= i, j < arr.length
 arr[i] == 2 * arr[j]
 
 
 Example 1:
 
 Input: arr = [10,2,5,3]
 Output: true
 Explanation: For i = 0 and j = 2, arr[i] == 10 == 2 * 5 == 2 * arr[j]
 Example 2:
 
 Input: arr = [3,1,7,11]
 Output: false
 Explanation: There is no i and j that satisfy the conditions.
 
 
 Constraints:
 
 2 <= arr.length <= 500
 -103 <= arr[i] <= 103
 */


func checkIfExistBinarySearch(_ arr: [Int]) -> Bool {
	let arr = arr.sorted()
	
	// print(arr)
	for i in (0..<arr.count) {
		var left = 0
		var right = arr.count - 1
		let value = 2 * arr[i]
		while left <= right {
			let mid  = (left + right) / 2
			// print(value, arr[mid])
			if mid != i, arr[mid] == value {
				return true
			} else if arr[mid] < value {
				left = mid + 1
			} else {
				right = mid - 1
			}
		}
	}
	
	return false
}

func checkIfExistHashTable(_ arr: [Int]) -> Bool {
	let table: [Int: Int] = {
		var table: [Int: Int] = [:]
		for i in (0..<arr.count) {
			table[arr[i]] = i
		}
		return table
	}()
	
	for i in (0..<arr.count) {
		if let index = table[arr[i] * 2], index != i {
			return true
		}
	}
	
	return false
}
