import Foundation

/*
 498. Diagonal Traverse - https://leetcode.com/problems/diagonal-traverse/description/
 Given an m x n matrix mat, return an array of all the elements of the array in a diagonal order.
 
 
 
 Example 1:
 
 
 Input: mat = [[1,2,3],[4,5,6],[7,8,9]]
 Output: [1,2,4,7,5,3,6,8,9]
 Example 2:
 
 Input: mat = [[1,2],[3,4]]
 Output: [1,2,3,4]
 
 
 Constraints:
 
 m == mat.length
 n == mat[i].length
 1 <= m, n <= 104
 1 <= m * n <= 104
 -105 <= mat[i][j] <= 105
 */


func findDiagonalOrder(_ mat: [[Int]]) -> [Int] {
	guard !mat.isEmpty else { return [] }
	var row = 0
	var col = 0
	var result: [Int] = []
	let m = mat.count
	let n = mat[0].count
	// print(m, n)
	for index in (0..<(m * n)) {
		// print(mat[row][col])
		result.append(mat[row][col])
		if (row + col) % 2 == 0 {
			if col == n - 1 {
				row += 1
			} else if row == 0 {
				col += 1
			} else {
				row -= 1
				col += 1
			}
			
		} else {
			if row == m - 1 {
				col += 1
			} else if col == 0 {
				row += 1
			} else {
				row += 1
				col -= 1
			}
		}
	}
	
	return result
}
