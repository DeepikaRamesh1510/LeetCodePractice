import Foundation

/*
 994. Rotting Oranges - https://leetcode.com/problems/rotting-oranges/
 
 You are given an m x n grid where each cell can have one of three values:
 
 0 representing an empty cell,
 1 representing a fresh orange, or
 2 representing a rotten orange.
 Every minute, any fresh orange that is 4-directionally adjacent to a rotten orange becomes rotten.
 
 Return the minimum number of minutes that must elapse until no cell has a fresh orange. If this is impossible, return -1.
 
 
 
 Example 1:
 
 
 Input: grid = [[2,1,1],[1,1,0],[0,1,1]]
 Output: 4
 Example 2:
 
 Input: grid = [[2,1,1],[0,1,1],[1,0,1]]
 Output: -1
 Explanation: The orange in the bottom left corner (row 2, column 0) is never rotten, because rotting only happens 4-directionally.
 Example 3:
 
 Input: grid = [[0,2]]
 Output: 0
 Explanation: Since there are already no fresh oranges at minute 0, the answer is just 0.
 
 
 Constraints:
 
 m == grid.length
 n == grid[i].length
 1 <= m, n <= 10
 grid[i][j] is 0, 1, or 2.

 */

func orangesRotting(_ grid: [[Int]]) -> Int {
	var queue: [(Int, Int)] = []
	var freshOranges = 0
	
	for row in (0..<grid.count) {
		for col in (0..<grid[0].count) {
			if grid[row][col] == 2 {
				queue.append((row, col))
			} else if grid[row][col] == 1 {
				freshOranges += 1
			}
		}
	}
	
	guard freshOranges > 0 else { return 0 }
	
	queue.append((-1, -1))
	
	var grid = grid
	var minutesElapsed = -1
	
	while !queue.isEmpty {
		let (row, col) = queue.removeFirst()
		
		guard row != -1 else {
			minutesElapsed += 1
			if !queue.isEmpty {
				queue.append((-1,-1))
			}
			continue
		}
		if row > 0 && grid[row - 1][col] == 1 {
			grid[row - 1][col] = 2
			queue.append((row - 1, col))
			freshOranges -= 1
		}
		
		if row < grid.count - 1 && grid[row + 1][col] == 1 {
			grid[row + 1][col] = 2
			queue.append((row + 1, col))
			freshOranges -= 1
		}
		
		if col > 0 && grid[row][col - 1] == 1 {
			grid[row][col - 1] = 2
			queue.append((row, col - 1))
			freshOranges -= 1
		}
		
		if col < grid[0].count - 1 && grid[row][col + 1] == 1 {
			grid[row][col + 1] = 2
			queue.append((row, col + 1))
			freshOranges -= 1
		}
	}
	
	return freshOranges == 0 ? minutesElapsed : -1
}
