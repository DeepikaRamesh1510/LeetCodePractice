import Foundation

/*
 54. Spiral Matrix - https://leetcode.com/problems/spiral-matrix/description/
 Given an m x n matrix, return all elements of the matrix in spiral order.
 
 
 
 Example 1:
 
 
 Input: matrix = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,3,6,9,8,7,4,5]
 Example 2:
 
 
 Input: matrix = [[1,2,3,4],[5,6,7,8],[9,10,11,12]]
 Output: [1,2,3,4,8,12,11,10,9,5,6,7]
 
 
 Constraints:
 
 m == matrix.length
 n == matrix[i].length
 1 <= m, n <= 10
 -100 <= matrix[i][j] <= 100
 */

func spiralOrder(_ matrix: [[Int]]) -> [Int] {
	var result: [Int] = []
	var left = 0
	var right = matrix[0].count - 1
	var top = 0
	var bottom = matrix.count - 1
	
	while result.count < matrix.count * matrix[0].count {
		
		for i in stride(from: left, to: right + 1, by: 1) {
			result.append(matrix[top][i])
		}
		
		for i in stride(from: top + 1, to: bottom + 1, by: 1) {
			result.append(matrix[i][right])
		}
		
		if top != bottom {
			for i in stride(from: right - 1, to: left - 1, by: -1) {
				result.append(matrix[bottom][i])
			}
		}
		
		if left != right {
			for i in stride(from: bottom - 1, to: top, by: -1) {
				result.append(matrix[i][left])
			}
		}
		
		left += 1
		right -= 1
		bottom -= 1
		top += 1
	}
	
	return result
}
