import Foundation


/*
 37. Sudoku Solver - https://leetcode.com/problems/sudoku-solver/
 
 Write a program to solve a Sudoku puzzle by filling the empty cells.
 
 A sudoku solution must satisfy all of the following rules:
 
 Each of the digits 1-9 must occur exactly once in each row.
 Each of the digits 1-9 must occur exactly once in each column.
 Each of the digits 1-9 must occur exactly once in each of the 9 3x3 sub-boxes of the grid.
 The '.' character indicates empty cells.
 Input: board = [["5","3",".",".","7",".",".",".","."],["6",".",".","1","9","5",".",".","."],[".","9","8",".",".",".",".","6","."],["8",".",".",".","6",".",".",".","3"],["4",".",".","8",".","3",".",".","1"],["7",".",".",".","2",".",".",".","6"],[".","6",".",".",".",".","2","8","."],[".",".",".","4","1","9",".",".","5"],[".",".",".",".","8",".",".","7","9"]]
 Output: [["5","3","4","6","7","8","9","1","2"],["6","7","2","1","9","5","3","4","8"],["1","9","8","3","4","2","5","6","7"],["8","5","9","7","6","1","4","2","3"],["4","2","6","8","5","3","7","9","1"],["7","1","3","9","2","4","8","5","6"],["9","6","1","5","3","7","2","8","4"],["2","8","7","4","1","9","6","3","5"],["3","4","5","2","8","6","1","7","9"]]
 */


/*
 Approach - backtracking, recusrion &  bitmasking
 
 1) find an empty cell
 2) try to get a valid number, to place in that position
 3) if able to place a number, go to step 2 & repeat
 else backtrack
 
 */


class Solution {
	
	func solveSudoku(_ board: inout [[Character]]) {
		_ = isSolved(&board)
	}
	
	func isSolved(_ board: inout [[Character]]) -> Bool {
		for i in (0..<board.count) {
			for j in (0..<board.count) where board[i][j] == "." {
				for num in 1...9 where isValid(num, i, j, board) {
					board[i][j] = Character("\(num)")
					if isSolved(&board) {
						return true
					} else {
						board[i][j] = "."
					}
				}
				return false
			}
		}
		return true
	}
	
	func isValid(_ num: Int, _ r: Int, _ c: Int, _ board: [[Character]]) -> Bool {
		let ch = Character("\(num)")
		for i in 0...8 {
			if board[r][i] == ch || board[i][c] == ch { return false}
			if board[(r/3) * 3 + i/3][(c/3) * 3 + i % 3] == ch { return false }
		}
		return true
	}
}

//var sudoku: [[Character]] = [["5","3",".",".","7",".",".",".","."],
//							 ["6",".",".","1","9","5",".",".","."],
//							 [".","9","8",".",".",".",".","6","."],
//							 ["8",".",".",".","6",".",".",".","3"],
//							 ["4",".",".","8",".","3",".",".","1"],
//							 ["7",".",".",".","2",".",".",".","6"],
//							 [".","6",".",".",".",".","2","8","."],
//							 [".",".",".","4","1","9",".",".","5"],
//							 [".",".",".",".","8",".",".","7","9"]]
//Solution().solveSudoku(&sudoku)
