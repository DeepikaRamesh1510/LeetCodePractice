import Foundation

/*
 200. Number of Islands - https://leetcode.com/problems/number-of-islands/description/
 
 Given an m x n 2D binary grid grid which represents a map of '1's (land) and '0's (water), return the number of islands.
 
 An island is surrounded by water and is formed by connecting adjacent lands horizontally or vertically. You may assume all four edges of the grid are all surrounded by water.
 
 
 
 Example 1:
 
 Input: grid = [
 ["1","1","1","1","0"],
 ["1","1","0","1","0"],
 ["1","1","0","0","0"],
 ["0","0","0","0","0"]
 ]
 Output: 1
 Example 2:
 
 Input: grid = [
 ["1","1","0","0","0"],
 ["1","1","0","0","0"],
 ["0","0","1","0","0"],
 ["0","0","0","1","1"]
 ]
 Output: 3
 
 
 Constraints:
 
 m == grid.length
 n == grid[i].length
 1 <= m, n <= 300
 grid[i][j] is '0' or '1'.
 */

func numIslandsDFS(_ grid: [[Character]]) -> Int {
	
	var grid = grid
	var noOfIslands = 0
	
	func dfs(_ row: Int, _ col: Int) {
		if row < 0 || col < 0 || row >= grid.count || col >= grid[0].count { return }
		guard grid[row][col] == "1" else { return }
		grid[row][col] = "0"
		dfs(row - 1, col)
		dfs(row + 1, col)
		dfs(row, col - 1)
		dfs(row, col + 1)
	}
	
	for row in (0..<grid.count) {
		for col in (0..<grid[row].count) {
			guard grid[row][col] == "1" else { continue }
			
			noOfIslands += 1
			dfs(row, col)
		}
	}
	return noOfIslands
}

func numIslandsBFS(_ grid: [[Character]]) -> Int {
	var grid = grid
	var queue: [(Int, Int)] = []
	var noOfIslands = 0
	
	for row in (0..<grid.count) {
		for col in (0..<grid[row].count) {
			guard grid[row][col] == "1" else { continue }
			
			noOfIslands += 1
			queue.append((row, col))
			
			while queue.count > 0 {
				let size = queue.count
				
				for _ in (0..<size) {
					let index = queue.removeFirst()
					let row = index.0
					let col = index.1
					
					if row > 0, grid[row - 1][col] == "1" {
						grid[row - 1][col] = "0"
						queue.append((row - 1, col))
					}
					if row < grid.count - 1, grid[row + 1][col] == "1" {
						grid[row + 1][col] = "0"
						queue.append((row + 1, col))
					}
					if col > 0, grid[row][col - 1] == "1" {
						grid[row][col - 1] = "0"
						queue.append((row, col - 1))
					}
					if col < grid[row].count - 1, grid[row][col + 1] == "1" {
						grid[row][col + 1] = "0"
						queue.append((row, col + 1))
					}
				}
			}
		}
	}
	
	return noOfIslands
}
