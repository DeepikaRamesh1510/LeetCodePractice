import Foundation

/*
 700. Search in a Binary Search Tree - https://leetcode.com/problems/search-in-a-binary-search-tree/description/
 You are given the root of a binary search tree (BST) and an integer val.
 
 Find the node in the BST that the node's value equals val and return the subtree rooted with that node. If such a node does not exist, return null.
 
 
 
 Example 1:
 
 
 Input: root = [4,2,7,1,3], val = 2
 Output: [2,1,3]
 Example 2:
 
 
 Input: root = [4,2,7,1,3], val = 5
 Output: []
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 5000].
 1 <= Node.val <= 107
 root is a binary search tree.
 1 <= val <= 107
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

fileprivate func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
	var root = root
	while root != nil && root!.val != val {
		if root!.val < val {
			root = root?.right
		} else {
			root = root?.left
		}
	}
	return root
}