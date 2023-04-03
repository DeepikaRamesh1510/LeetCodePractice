import Foundation

/*
 250. Count Univalue Subtrees - https://leetcode.com/problems/count-univalue-subtrees/description/
 Given the root of a binary tree, return the number of uni-value
 subtrees
 .
 
 A uni-value subtree means all nodes of the subtree have the same value.
 
 
 
 Example 1:
 
 
 Input: root = [5,1,5,5,5,null,5]
 Output: 4
 Example 2:
 
 Input: root = []
 Output: 0
 Example 3:
 
 Input: root = [5,5,5,5,5,null,5]
 Output: 6
 
 
 Constraints:
 
 The number of the node in the tree will be in the range [0, 1000].
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

fileprivate func countUnivalSubtrees(_ root: TreeNode?) -> Int {
	guard let root = root else { return 0 }
	var count: Int = 0
	_ = isUnivalSubTree(root, &count)
	return count
}

fileprivate func isUnivalSubTree(_ node: TreeNode, _ count: inout Int) -> Bool {
	if node.left == nil && node.right == nil {
		count += 1
		return true
	}
	
	var isUni = true
	
	if node.left != nil {
		isUni = isUnivalSubTree(node.left!, &count) && isUni && node.val == node.left!.val
	}
	
	if node.right != nil {
		isUni = isUnivalSubTree(node.right!, &count) && isUni && node.val == node.right!.val
	}
	
	if !isUni { return false }
	count += 1
	return true
}
