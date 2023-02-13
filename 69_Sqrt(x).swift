import Foundation

/*
 69. Sqrt(x)

 Given a non-negative integer x, return the square root of x rounded down to the nearest integer. The returned integer should be non-negative as well.
 
 You must not use any built-in exponent function or operator.
 
 For example, do not use pow(x, 0.5) in c++ or x ** 0.5 in python.
 
 
 Example 1:
 
 Input: x = 4
 Output: 2
 Explanation: The square root of 4 is 2, so we return 2.
 Example 2:
 
 Input: x = 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since we round it down to the nearest integer, 2 is returned.
 */

func mySqrt(_ x: Int) -> Int {
	
	guard x >= 2 else { return x }
	
	var left = 0
	var right: Int = x/2
	
	while left <= right {
		let pivot = left + (right - left) / 2
		let num = pivot * pivot
		
		if num == x {
			return pivot
		} else if num < x {
			left = pivot + 1
		} else {
			right = pivot - 1
		}
	}
	
	return right
}

//mySqrt(2)
