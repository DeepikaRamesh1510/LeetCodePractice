import Foundation

/*
 199. Binary Tree Right Side View - https://leetcode.com/problems/binary-tree-right-side-view/description/
 Given the root of a binary tree, imagine yourself standing on the right side of it, return the values of the nodes you can see ordered from top to bottom.
 
 
 
 Example 1:
 
 
 Input: root = [1,2,3,null,5,null,4]
 Output: [1,3,4]
 Example 2:
 
 Input: root = [1,null,3]
 Output: [1,3]
 Example 3:
 
 Input: root = []
 Output: []
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 100].
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

fileprivate func rightSideView(_ root: TreeNode?) -> [Int] {
	var result: [Int] = []
	guard var node = root else { return [] }
	var queue: [TreeNode] = [node]
	
	while !queue.isEmpty {
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
		result.append(node.val)
		
		// node = node!.right
	}
	return result
}
