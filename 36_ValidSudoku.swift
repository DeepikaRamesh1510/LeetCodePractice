import Foundation

/*
 36. Valid Sudoku - https://leetcode.com/problems/valid-sudoku/
 
 Determine if a 9 x 9 Sudoku board is valid. Only the filled cells need to be validated according to the following rules:

 Each row must contain the digits 1-9 without repetition.
 Each column must contain the digits 1-9 without repetition.
 Each of the nine 3 x 3 sub-boxes of the grid must contain the digits 1-9 without repetition.
 Note:

 A Sudoku board (partially filled) could be valid but is not necessarily solvable.
 Only the filled cells need to be validated according to the mentioned rules.
 
 Input: board =
 [["5","3",".",".","7",".",".",".","."]
 ,["6",".",".","1","9","5",".",".","."]
 ,[".","9","8",".",".",".",".","6","."]
 ,["8",".",".",".","6",".",".",".","3"]
 ,["4",".",".","8",".","3",".",".","1"]
 ,["7",".",".",".","2",".",".",".","6"]
 ,[".","6",".",".",".",".","2","8","."]
 ,[".",".",".","4","1","9",".",".","5"]
 ,[".",".",".",".","8",".",".","7","9"]]
 Output: true
 */

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var rows: [Int] = Array<Int>(repeating: 0, count: 9)
    var (columns, box) = (rows, rows)
    
    for r in (0..<9) {
        for c in (0..<9) {
            guard board[r][c] != "." else { continue }
            
            guard let num: Int = Int(String(board[r][c])) else { continue }
            
            let pos: Int = 1 << (num - 1)
          
            guard pos & rows[r] == 0 else { return false }
            
            rows[r] = pos | rows[r]
            
            guard pos & columns[c] == 0 else { return false }
            
            columns[c] = pos | columns[c]
            
            let boxIndex: Int = (r/3) * 3 + c/3
            
            guard pos & box[boxIndex] == 0 else { return false }
            
            box[boxIndex] = pos | box[boxIndex]
        }
    }
    
    return true
}

//isValidSudoku([[".",".",".",".",".",".",".",".","."],
//               [".",".",".",".",".",".",".",".","."],
//               [".","9",".",".",".",".",".",".","1"],
//               ["8",".",".",".",".",".",".",".","."],
//               [".","9","9","3","5","7",".",".","."],
//               [".",".",".",".",".",".",".","4","."],
//               [".",".",".","8",".",".",".",".","."],
//               [".","1",".",".",".",".","4",".","9"],
//               [".",".",".","5",".","4",".",".","."]]
//)
