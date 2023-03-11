import Foundation

/*
 120. Triangle - https://leetcode.com/problems/triangle/description/
 
 Given a triangle array, return the minimum path sum from top to bottom.
 
 For each step, you may move to an adjacent number of the row below. More formally, if you are on index i on the current row, you may move to either index i or index i + 1 on the next row.
 
 
 
 Example 1:
 
 Input: triangle = [[2],[3,4],[6,5,7],[4,1,8,3]]
 Output: 11
 Explanation: The triangle looks like:
 2
 3 4
 6 5 7
 4 1 8 3
 The minimum path sum from top to bottom is 2 + 3 + 5 + 1 = 11 (underlined above).
 Example 2:
 
 Input: triangle = [[-10]]
 Output: -10
 
 
 Constraints:
 
 1 <= triangle.length <= 200
 triangle[0].length == 1
 triangle[i].length == triangle[i - 1].length + 1
 -104 <= triangle[i][j] <= 104
 
 
 Follow up: Could you do this using only O(n) extra space, where n is the total number of rows in the triangle?
 */


func minimumTotal(_ triangle: [[Int]]) -> Int {
	
	var dp: [Int] = Array(repeating: 0, count: triangle[triangle.count - 1].count)
	var row = triangle.count - 1
	
	while row >= 0 {
		for col in (0..<triangle[row].count) {
			if row == triangle.count - 1 {
				dp[col] = triangle[row][col]
			} else {
				dp[col] = min(dp[col], dp[col + 1]) + triangle[row][col]
			}
		}
		
		row -= 1
	}
	
	return dp[0]
}

func minimumTotalUsingInput(_ triangle: [[Int]]) -> Int {
	
	var triangle = triangle
	var row = triangle.count - 2
	
	while row >= 0 {
		for col in (0..<triangle[row].count) {
			triangle[row][col] = min(triangle[row + 1][col], triangle[row + 1][col + 1]) + triangle[row][col]
		}
		
		row -= 1
	}
	
	return triangle[0][0]
}


func minimumTotalWithNPow2Space(_ triangle: [[Int]]) -> Int {
	var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: triangle[triangle.count - 1].count + 1), count: triangle.count + 1)
	
	var row = triangle.count - 1
	
	while row >= 0 {
		for col in (0..<triangle[row].count) {
			dp[row][col] = min(dp[row + 1][col], dp[row + 1][col + 1]) + triangle[row][col]
		}
		
		row -= 1
	}
	
	return dp[0][0]
}

//minimumTotal([[-2], [-1,-2]])
