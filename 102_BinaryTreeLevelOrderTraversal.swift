import Foundation

/*
 102. Binary Tree Level Order Traversal - https://leetcode.com/problems/binary-tree-level-order-traversal/description/
 Given the root of a binary tree, return the level order traversal of its nodes' values. (i.e., from left to right, level by level).
 
 
 
 Example 1:
 
 
 Input: root = [3,9,20,null,null,15,7]
 Output: [[3],[9,20],[15,7]]
 Example 2:
 
 Input: root = [1]
 Output: [[1]]
 Example 3:
 
 Input: root = []
 Output: []
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 2000].
 -1000 <= Node.val <= 1000
 */

fileprivate class TreeNode {
	var val: Int
	var left: TreeNode?
	var right: TreeNode?
	init() { self.val = 0; self.left = nil; self.right = nil; }
	init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
	init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
		self.val = val
		self.left = left
		self.right = right
	}
}

fileprivate func levelOrder(_ root: TreeNode?) -> [[Int]] {
	guard var node = root else { return [] }
	var q: [TreeNode] = []
	var result: [[Int]] = []
	q.append(node)
	
	while !q.isEmpty {
		let size = q.count
		var subResult: [Int] = []
		for _ in (0..<size) {
			node = q.removeFirst()
			if let left = node.left {
				q.append(left)
			}
			
			if let right = node.right {
				q.append(right)
			}
			subResult.append(node.val)
		}
		result.append(subResult)
	}
	return result
}
