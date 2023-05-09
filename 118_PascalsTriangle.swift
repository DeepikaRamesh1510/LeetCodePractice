import Foundation

/*
 118. Pascal's Triangle - https://leetcode.com/problems/pascals-triangle/description/
 Given an integer numRows, return the first numRows of Pascal's triangle.
 
 In Pascal's triangle, each number is the sum of the two numbers directly above it as shown:
 
 
 
 
 Example 1:
 
 Input: numRows = 5
 Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
 Example 2:
 
 Input: numRows = 1
 Output: [[1]]
 
 
 Constraints:
 
 1 <= numRows <= 30
 */

func generate(_ numRows: Int) -> [[Int]] {
	if numRows == 1 { return [[1]] }
	if numRows == 2 { return [[1], [1,1]]}
	var result: [[Int]] = [[1], [1, 1]]
	for i in (2..<numRows) {
		var subResult: [Int] = []
		for j in (0...i) {
			if j == 0 || j == i {
				subResult.append(1)
			} else {
				subResult.append(result[i-1][j-1] + result[i-1][j])
			}
		}
		// print(subResult)
		result.append(subResult)
	}
	return result
}