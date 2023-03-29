import Foundation

/*
 94. Binary Tree Inorder Traversal - https://leetcode.com/problems/binary-tree-inorder-traversal/description/
 
 Given the root of a binary tree, return the inorder traversal of its nodes' values.
 
 
 
 Example 1:
 
 
 Input: root = [1,null,2,3]
 Output: [1,3,2]
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

fileprivate func inorderTraversal(_ root: TreeNode?) -> [Int] {
	var stack: [TreeNode] = []
	var node = root
	var result: [Int] = []
	
	while node != nil || !stack.isEmpty {
		while node != nil {
			//   print(node!.val)
			stack.append(node!)
			node = node!.left
		}
		
		node = stack.removeLast()
		result.append(node!.val)
		node = node!.right
	}
	
	return result
}
