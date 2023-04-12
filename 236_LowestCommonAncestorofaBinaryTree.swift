import Foundation

/*
 236. Lowest Common Ancestor of a Binary Tree - https://leetcode.com/problems/lowest-common-ancestor-of-a-binary-tree/description/
 
 Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.
 
 According to the definition of LCA on Wikipedia: “The lowest common ancestor is defined between two nodes p and q as the lowest node in T that has both p and q as descendants (where we allow a node to be a descendant of itself).”
 
 
 
 Example 1:
 
 
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 1
 Output: 3
 Explanation: The LCA of nodes 5 and 1 is 3.
 Example 2:
 
 
 Input: root = [3,5,1,6,2,0,8,null,null,7,4], p = 5, q = 4
 Output: 5
 Explanation: The LCA of nodes 5 and 4 is 5, since a node can be a descendant of itself according to the LCA definition.
 Example 3:
 
 Input: root = [1,2], p = 1, q = 2
 Output: 1
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [2, 105].
 -109 <= Node.val <= 109
 All Node.val are unique.
 p != q
 p and q will exist in the tree.
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

fileprivate func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
	guard let root = root else { return nil }
	if root.val == p!.val || root.val == q!.val {
		return root
	}
	
	let left = lowestCommonAncestor(root.left, p, q)
	let right = lowestCommonAncestor(root.right, p, q)
	
	if left != nil && right != nil {
		return root
	} else {
		return left ?? right
	}
}
