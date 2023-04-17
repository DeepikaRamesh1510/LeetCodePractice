import Foundation

/*
 110. Balanced Binary Tree - https://leetcode.com/problems/balanced-binary-tree/description/
 Given a binary tree, determine if it is
 height-balanced
 .
 Example 1:
 
 
 Input: root = [3,9,20,null,null,15,7]
 Output: true
 Example 2:
 
 
 Input: root = [1,2,2,3,3,null,null,4,4]
 Output: false
 Example 3:
 
 Input: root = []
 Output: true
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 5000].
 -104 <= Node.val <= 104
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

fileprivate func isBalanced(_ root: TreeNode?) -> Bool {
	guard let root = root else { return true }
	let isLeftBalanced = isBalanced(root.left)
	if !isLeftBalanced { return false }
	let isRightBalanced = isBalanced(root.right)
	if !isRightBalanced { return false }
	return abs(getHeight(root.left) - getHeight(root.right)) < 2
}

fileprivate func getHeight(_ node: TreeNode?) -> Int {
	if node == nil { return 0 }
	return 1 + max(getHeight(node!.left), getHeight(node!.right))
}
