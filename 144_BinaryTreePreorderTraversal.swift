import Foundation

/*
 144. Binary Tree Preorder Traversal - https://leetcode.com/problems/binary-tree-preorder-traversal/description/
 Given the root of a binary tree, return the preorder traversal of its nodes' values.
 
 
 
 Example 1:
 
 
 Input: root = [1,null,2,3]
 Output: [1,2,3]
 Example 2:
 
 Input: root = []
 Output: []
 Example 3:
 
 Input: root = [1]
 Output: [1]
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
 
 
 Follow up: Recursive solution is trivial, could you do it iteratively?
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

fileprivate func preorderTraversal(_ root: TreeNode?) -> [Int] {
	var stack: [TreeNode] = []
	var node = root
	if node != nil {
		stack.append(node!)
	} else {
		return []
	}
	var result: [Int] = []
	
	while !stack.isEmpty {
		node = stack.removeLast()
		result.append(node!.val)
		
		if let rightChild = node?.right {
			stack.append(rightChild)
		}
		
		if let leftChild = node?.left {
			stack.append(leftChild)
		}
	}
	
	return result
}
