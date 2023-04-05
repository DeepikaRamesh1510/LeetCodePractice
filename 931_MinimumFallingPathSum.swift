import Foundation

/*
 931. Minimum Falling Path Sum - https://leetcode.com/problems/minimum-falling-path-sum/description/
 
 Given an n x n array of integers matrix, return the minimum sum of any falling path through matrix.
 
 A falling path starts at any element in the first row and chooses the element in the next row that is either directly below or diagonally left/right. Specifically, the next element from position (row, col) will be (row + 1, col - 1), (row + 1, col), or (row + 1, col + 1).
 
 
 
 Example 1:
 
 
 Input: matrix = [[2,1,3],[6,5,4],[7,8,9]]
 Output: 13
 Explanation: There are two falling paths with a minimum sum as shown.
 Example 2:
 
 
 Input: matrix = [[-19,57],[-40,-5]]
 Output: -59
 Explanation: The falling path with a minimum sum is shown.
 
 
 Constraints:
 
 n == matrix.length == matrix[i].length
 1 <= n <= 100
 -100 <= matrix[i][j] <= 100
 */

// Bottom down approach

func minFallingPathSum(_ matrix: [[Int]]) -> Int {
	
	var minSum = Int.max
	var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
	
	var row = matrix.count - 1
	while row >= 0 {
		
		for col in (0..<matrix[0].count) {
			
			if col == 0 {
				dp[row][col] = min(dp[row + 1][col], dp[row + 1][col + 1]) + matrix[row][col]
			} else if col == matrix[0].count - 1 {
				dp[row][col] = min(dp[row + 1][col], dp[row + 1][col - 1]) + matrix[row][col]
			} else {
				dp[row][col] = min(
					dp[row + 1][col],
					dp[row + 1][col + 1],
					dp[row + 1][col - 1]
				) + matrix[row][col]
			}
		}
		
		row -= 1
	}
	
	for col in (0..<matrix[0].count) {
		minSum = min(minSum, dp[0][col])
	}
	
	return minSum
}

// Top-down

func minFallingPathSumTDIterative(_ matrix: [[Int]]) -> Int {
	var minSum = Int.max
	var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: matrix[0].count + 1), count: matrix.count + 1)
	
	for row in (0..<matrix.count) {
		for col in (0..<matrix[0].count) {
			if col == 0 {
				dp[row + 1][col] = min(dp[row][col], dp[row][col + 1]) + matrix[row][col]
			} else if col == matrix[0].count - 1 {
				dp[row + 1][col] = min(dp[row][col], dp[row][col - 1]) + matrix[row][col]
			} else {
				dp[row + 1][col] = min(dp[row][col], dp[row][col + 1], dp[row][col - 1]) + matrix[row][col]
			}
		}
	}
	
	for col in (0..<matrix[0].count) {
		print(matrix.count, dp.count)
		minSum = min(minSum, dp[matrix.count][col])
	}
	
	return minSum
}

func minFallingPathSumTDRecursive(_ matrix: [[Int]]) -> Int {
	
	func findMinPathSum(_ matrix: [[Int]], _ row: Int, _ col: Int, _ dp: inout [[Int?]]) -> Int {
		
		if col < 0 || col >= matrix[0].count { return Int.max }
		
		if row == matrix.count - 1 { return matrix[row][col] }
		
		if let value = dp[row][col] {
			return value
		}
		
		let value = min(
			findMinPathSum(matrix, row+1, col - 1, &dp),
			findMinPathSum(matrix, row+1, col, &dp),
			findMinPathSum(matrix, row+1, col + 1, &dp)
		) + matrix[row][col]
		
		dp[row][col] = value
		return value
	}
	
	var minSum = Int.max
	var dp: [[Int?]] = Array(repeating: Array(repeating: nil, count: matrix[0].count), count: matrix.count)
	
	for col in (0..<matrix[0].count) {
		minSum = min(minSum, findMinPathSum(matrix, 0, col, &dp))
	}
	
	return minSum
}


// Greedy approach won't work for all the testCases in finding the min in the matrix
func minFallingPathSumGreedy(_ matrix: [[Int]]) -> Int {
	
	func getTheMin(_ left: (Int, Int), _ down: (Int, Int), _ right: (Int, Int)) -> (Int, Int) {
		var ans = left.0 < down.0 ? left : down
		ans = ans.0 < right.0 ? ans : right
		return ans
	}
	
	var minSum = Int.max
	
	for col in (0..<matrix[0].count) {
		
		var sum = 0
		var chosenCol = col
		
		for row in (0...matrix.count) {
			if row == 0 {
				sum = matrix[row][col]
				continue
			}
			
			guard row < matrix.count else { continue }
			let leftAdj = (chosenCol == 0 ? Int.max : matrix[row][chosenCol - 1], chosenCol - 1)
			let downAdj = (matrix[row][chosenCol], chosenCol)
			let rightAdj = (chosenCol < matrix[0].count - 1 ? matrix[row][chosenCol + 1] : Int.max, chosenCol + 1)
			
			let min = getTheMin(leftAdj, downAdj, rightAdj)
			print("row: \(row), minValue: \(min.0)")
			sum = sum + min.0
			chosenCol = min.1
		}
		minSum = min(minSum, sum)
	}
	
	return minSum
}

//minFallingPathSum([[-48]])
