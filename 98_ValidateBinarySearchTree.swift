import Foundation

/*
 98. Validate Binary Search Tree - https://leetcode.com/problems/validate-binary-search-tree
 Given the root of a binary tree, determine if it is a valid binary search tree (BST).
 
 A valid BST is defined as follows:
 
 The left
 subtree
 of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 
 Example 1:
 
 
 Input: root = [2,1,3]
 Output: true
 Example 2:
 
 
 Input: root = [5,1,4,null,null,3,6]
 Output: false
 Explanation: The root node's value is 5 but its right child's value is 4.
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 104].
 -231 <= Node.val <= 231 - 1
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

// Inorder traversal

fileprivate func isValidBST(_ root: TreeNode?) -> Bool {
	var root = root
	var stack: [TreeNode] = []
	var prev: Int? = nil
	
	while !stack.isEmpty || root != nil {
		while root != nil {
			stack.append(root!)
			root = root!.left
		}
		
		root = stack.removeLast()
		if let prev = prev, let root = root, root.val <= prev {
			return false
		}
		prev = root?.val
		root = root?.right
	}
	
	return true
}


// Recursive - with range

fileprivate func isValidBSTRecursive(_ root: TreeNode?) -> Bool {
	return validate(root, nil, nil)
}

fileprivate func validate(_ root: TreeNode?, _ low: Int?, _ high: Int?) -> Bool {
	guard let root = root else { return true }
	
	if low != nil && root.val <= low! || high != nil && root.val >= high! { return false }
	return validate(root.left, low, root.val) && validate(root.right, root.val, high)
}
