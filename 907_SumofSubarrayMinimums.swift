import Foundation

/*
 907. Sum of Subarray Minimums
 
 Given an array of integers arr, find the sum of min(b), where b ranges over every (contiguous) subarray of arr. Since the answer may be large, return the answer modulo 109 + 7.
 
 
 
 Example 1:
 
 Input: arr = [3,1,2,4]
 Output: 17
 Explanation:
 Subarrays are [3], [1], [2], [4], [3,1], [1,2], [2,4], [3,1,2], [1,2,4], [3,1,2,4].
 Minimums are 3, 1, 2, 4, 1, 1, 2, 1, 1, 1.
 Sum is 17.
 Example 2:
 
 Input: arr = [11,81,94,43,3]
 Output: 444
 
 
 Constraints:
 
 1 <= arr.length <= 3 * 104
 1 <= arr[i] <= 3 * 104
 */

func sumSubarrayMins(_ arr: [Int]) -> Int {
	var stack: Stack = Stack()
	var dp: [Int] =  Array(repeating: 0, count: arr.count)
	
	for i in (0..<arr.count) {
		
		while !stack.isEmpty && arr[stack.peek()] > arr[i] {
			stack.pop()
		}
		
		if stack.isEmpty {
			dp[i] = (i + 1) * arr[i]
		} else {
			let j = stack.peek()
			dp[i] = dp[j] + (i - j) * arr[i]
		}
		
		stack.push(i)
	}
	
	let mod: Int = Int(1E9) + 7
	return dp.reduce(0) {
		return ($0 + $1) % mod
	}
	
	
}

struct Stack {
	var value: [Int] = []
	
	var isEmpty: Bool {
		value.isEmpty
	}
	
	func peek() -> Int {
		return value.last ?? 0
	}
	
	@discardableResult mutating func pop() -> Int? {
		return value.removeLast()
	}
	
	mutating func push(_ a: Int) {
		value.append(a)
	}
	
}


//func sumSubarrayMins(_ arr: [Int]) -> Int {
//	var result: Int = 0
//
//	for i in (1...arr.count) {
//		var subArrayElement: [Int] = []
//		var left = 0
//		var right = 0
//
//		while right < arr.count {
//			subArrayElement.append(arr[right])
//			right += 1
//
//			if right - left == i {
//				result += subArrayElement.min() ?? 0
//				subArrayElement = []
//				left += 1
//				right = left
//			}
//		}
//
//	}
//
//	return result
//}

//sumSubarrayMins([3,1,2,4])
