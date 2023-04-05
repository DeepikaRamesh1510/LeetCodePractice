import Foundation

/*
 104. Maximum Depth of Binary Tree - https://leetcode.com/problems/maximum-depth-of-binary-tree/
 Given the root of a binary tree, return its maximum depth.
 
 A binary tree's maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.
 
 
 
 Example 1:
 
 
 Input: root = [3,9,20,null,null,15,7]
 Output: 3
 Example 2:
 
 Input: root = [1,null,2]
 Output: 2
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 104].
 -100 <= Node.val <= 100
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

//Using BFS
fileprivate func maxDepth(_ root: TreeNode?) -> Int {
	if root == nil { return 0 }
	var depth = 0
	var node: TreeNode = root!
	var queue: [TreeNode] = [node]
	
	while !queue.isEmpty {
		depth += 1
		let size = queue.count
		for _ in (0..<size) {
			node = queue.removeFirst()
			if let left = node.left {
				queue.append(left)
			}
			if let right = node.right {
				queue.append(right)
			}
		}
	}
	
	return depth
}
