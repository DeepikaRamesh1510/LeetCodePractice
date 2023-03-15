import Foundation

/*
 542. 01 Matrix - https://leetcode.com/problems/01-matrix/

 Given an m x n binary matrix mat, return the distance of the nearest 0 for each cell.
 
 The distance between two adjacent cells is 1.
 
 
 
 Example 1:
 
 
 Input: mat = [[0,0,0],[0,1,0],[0,0,0]]
 Output: [[0,0,0],[0,1,0],[0,0,0]]
 Example 2:
 
 
 Input: mat = [[0,0,0],[0,1,0],[1,1,1]]
 Output: [[0,0,0],[0,1,0],[1,2,1]]
 
 
 Constraints:
 
 m == mat.length
 n == mat[i].length
 1 <= m, n <= 104
 1 <= m * n <= 104
 mat[i][j] is either 0 or 1.
 There is at least one 0 in mat.

 */

func updateMatrix(_ mat: [[Int]]) -> [[Int]] {
	var queue: [(Int, Int, Int)] = []
	var dist: [[Int]] = Array(repeating: Array(repeating: -1, count: mat[0].count), count: mat.count)
	for row in (0..<mat.count) {
		for col in (0..<mat[0].count) {
			if mat[row][col] == 0 {
				queue.append((row, col, 0))
			}
		}
	}
	
	while !queue.isEmpty {
		let currentElement = queue.removeFirst()
		let row = currentElement.0
		let col = currentElement.1
		let dept = currentElement.2
		
		if dist[row][col] == -1 {
			dist[row][col] = dept
		}
		
		if row > 0 && dist[row - 1][col] == -1 {
			queue.append((row - 1, col, dept + 1))
		}
		
		if row < mat.count - 1 && dist[row + 1][col] == -1 {
			queue.append((row + 1, col, dept + 1))
		}
		
		if col > 0 && dist[row][col - 1] == -1 {
			queue.append((row, col - 1,dept + 1))
		}
		
		if col < mat[0].count - 1 && dist[row][col + 1] == -1 {
			queue.append((row, col + 1, dept + 1))
		}
	}
	
	return dist
}

func updateMatrixDP(_ mat: [[Int]]) -> [[Int]] {
	
	var dp: [[Int]] = Array(repeating: Array(repeating: Int.max - 1, count: mat[0].count), count: mat.count)
	
	for row in (0..<mat.count) {
		for col in (0..<mat[0].count) {
			
			if mat[row][col] == 0 {
				dp[row][col] = 0
			}
			
			if row > 0 {
				dp[row][col] = min(dp[row][col], dp[row - 1][col] + 1)
			}
			
			if col > 0 {
				dp[row][col] = min(dp[row][col], dp[row][col - 1] + 1)
			}
		}
	}
	
	var row = mat.count - 1
	var col = mat[0].count - 1
	
	while row >= 0 {
		while col >= 0 {
			print(row, col)
			if dp[row][col] == 0 {
				col -= 1
				continue
			}
			if row < mat.count - 1 {
				dp[row][col] = min(dp[row][col], dp[row + 1][col] + 1)
			}
			if col < mat[0].count - 1 {
				dp[row][col] = min(dp[row][col], dp[row][col + 1] + 1)
			}
			col -= 1
		}
		col = mat[0].count - 1
		row -= 1
	}
	
	return dp
}

//updateMatrix([[0,0,0],[0,1,0],[1,1,1]])
