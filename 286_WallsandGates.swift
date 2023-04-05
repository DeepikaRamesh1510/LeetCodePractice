import Foundation

/*
 286. Walls and Gates - https://leetcode.com/problems/walls-and-gates/description/
 
 You are given an m x n grid rooms initialized with these three possible values.
 
 -1 A wall or an obstacle.
 0 A gate.
 INF Infinity means an empty room. We use the value 231 - 1 = 2147483647 to represent INF as you may assume that the distance to a gate is less than 2147483647.
 Fill each empty room with the distance to its nearest gate. If it is impossible to reach a gate, it should be filled with INF.
 
 
 
 Example 1:
 
 
 Input: rooms = [[2147483647,-1,0,2147483647],[2147483647,2147483647,2147483647,-1],[2147483647,-1,2147483647,-1],[0,-1,2147483647,2147483647]]
 Output: [[3,-1,0,1],[2,2,1,-1],[1,-1,2,-1],[0,-1,3,4]]
 Example 2:
 
 Input: rooms = [[-1]]
 Output: [[-1]]
 
 
 Constraints:
 
 m == rooms.length
 n == rooms[i].length
 1 <= m, n <= 250
 rooms[i][j] is -1, 0, or 231 - 1.
 */


func wallsAndGates(_ rooms: inout [[Int]]) {
	var queue: [(Int, Int, Int)] = []
	let emptyRoomConstant = 2147483647
	
	for row in (0..<rooms.count) {
		for col in (0..<rooms[row].count) where rooms[row][col] == 0 {
			queue.append((row, col, 0))
		}
	}
	
	while queue.count > 0 {
		
		let size = queue.count
		
		for _ in (0..<size) {
			let index = queue.removeFirst()
			let row = index.0
			let col = index.1
			let depth = index.2
			
			if row > 0, rooms[row - 1][col] == emptyRoomConstant {
				rooms[row - 1][col] =  depth + 1
				queue.append((row - 1, col, depth + 1))
			}
			if row < rooms.count - 1, rooms[row + 1][col] == emptyRoomConstant  {
				rooms[row + 1][col] = depth + 1
				queue.append((row + 1, col, depth + 1))
			}
			if col > 0, rooms[row][col - 1] == emptyRoomConstant {
				rooms[row][col - 1] = depth + 1
				queue.append((row, col - 1, depth + 1))
			}
			if col < rooms[row].count - 1, rooms[row][col + 1] == emptyRoomConstant {
				rooms[row][col + 1] = depth + 1
				queue.append((row, col + 1, depth + 1))
			}
		}
	}
}
