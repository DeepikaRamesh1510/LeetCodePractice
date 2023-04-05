import Foundation

/*
 695. Max Area of Island - https://leetcode.com/problems/max-area-of-island/description
 
 You are given an m x n binary matrix grid. An island is a group of 1's (representing land) connected 4-directionally (horizontal or vertical.) You may assume all four edges of the grid are surrounded by water.
 
 The area of an island is the number of cells with a value 1 in the island.
 
 Return the maximum area of an island in grid. If there is no island, return 0.
 
 
 
 Example 1:
 
 
 Input: grid = [[0,0,1,0,0,0,0,1,0,0,0,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,1,1,0,1,0,0,0,0,0,0,0,0],[0,1,0,0,1,1,0,0,1,0,1,0,0],[0,1,0,0,1,1,0,0,1,1,1,0,0],[0,0,0,0,0,0,0,0,0,0,1,0,0],[0,0,0,0,0,0,0,1,1,1,0,0,0],[0,0,0,0,0,0,0,1,1,0,0,0,0]]
 Output: 6
 Explanation: The answer is not 11, because the island must be connected 4-directionally.
 Example 2:
 
 Input: grid = [[0,0,0,0,0,0,0,0]]
 Output: 0
 
 
 Constraints:
 
 m == grid.length
 n == grid[i].length
 1 <= m, n <= 50
 grid[i][j] is either 0 or 1.
 */


func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
	var grid = grid
	var maxArea = 0
	
	for row in (0..<grid.count) {
		for column in (0..<grid[0].count) where grid[row][column] == 1 {
			maxArea = max(maxArea, getArea(&grid, row, column))
		}
	}
	return maxArea
}

func getArea(_ grid: inout [[Int]], _ row: Int, _ column: Int) -> Int {
	
	if row < 0 || column < 0 || row > grid.count - 1 || column > grid[0].count - 1 || grid[row][column] == 0 {
		return 0
	}
	grid[row][column] = 0
	return (1
			+ getArea(&grid, row - 1, column)
			+ getArea(&grid, row, column - 1)
			+ getArea(&grid, row + 1, column)
			+ getArea(&grid, row, column + 1)
	)
}

//maxAreaOfIsland([
//	[0,0,1,0,0,0,0,1,0,0,0,0,0],
//	[0,0,0,0,0,0,0,1,1,1,0,0,0],
//	[0,1,1,0,1,0,0,0,0,0,0,0,0],
//	[0,1,0,0,1,1,0,0,0,0,1,0,0],
//	[0,1,0,0,1,1,0,0,1,1,1,0,0],
//	[0,0,0,0,0,0,0,0,0,0,1,0,0],
//	[0,0,0,0,0,0,0,1,1,1,0,0,0],
//	[0,0,0,0,0,0,0,1,1,0,0,0,0]
//])
