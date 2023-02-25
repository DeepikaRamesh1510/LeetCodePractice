import Foundation

/*
 50. Pow(x, n) - https://leetcode.com/problems/powx-n/

 Implement pow(x, n), which calculates x raised to the power n (i.e., xn).
 
 
 
 Example 1:
 
 Input: x = 2.00000, n = 10
 Output: 1024.00000
 Example 2:
 
 Input: x = 2.10000, n = 3
 Output: 9.26100
 Example 3:
 
 Input: x = 2.00000, n = -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 
 
 Constraints:
 
 -100.0 < x < 100.0
 -231 <= n <= 231-1
 n is an integer.
 -104 <= xn <= 104
 */



func myPow(_ x: Double, _ n: Int) -> Double {
	
	var pow = n
	var base = x
	
	if n < 0 {
		pow = -n
		base = 1 / base
	}
	
	var ans: Double = 1
	var half: Double = base
	while pow > 0 {
		
		print(pow, half, ans)
		if pow % 2 == 1 {
			ans = ans * half
		}
		half = half * half
		
		pow /= 2
	}
	return ans
}

func myPow1(_ x: Double, _ n: Int) -> Double {
	
	func recursion(_ x: Double, _ n: Int) -> Double {
		
		if n == 0 {
			return 1
		}
		
		let half = recursion(x, n/2)
		
		if n % 2 == 0 {
			return half * half
		} else {
			return half * half * x
		}
	}
	
	var pow = n
	var base = x
	
	if n < 0 {
		pow = -n
		base = 1 / base
	}
	
	return recursion(base, pow)
}

//myPow(5, 5)
