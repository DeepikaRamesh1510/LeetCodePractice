import Foundation

/*
 285. Inorder Successor in BST - https://leetcode.com/problems/inorder-successor-in-bst/description/
 Given the root of a binary search tree and a node p in it, return the in-order successor of that node in the BST. If the given node has no in-order successor in the tree, return null.
 
 The successor of a node p is the node with the smallest key greater than p.val.
 
 
 
 Example 1:
 
 
 Input: root = [2,1,3], p = 1
 Output: 2
 Explanation: 1's in-order successor node is 2. Note that both p and the return value is of TreeNode type.
 Example 2:
 
 
 Input: root = [5,3,6,2,4,null,null,1], p = 6
 Output: null
 Explanation: There is no in-order successor of the current node, so the answer is null.
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 104].
 -105 <= Node.val <= 105
 All Nodes will have unique values.
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

// space complexity: O(1)
fileprivate func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
	
	guard let p = p else { return nil }
	var root = root
	var successor: TreeNode? = nil
	
	while root != nil {
		if p.val >= root!.val {
			root = root!.right
		} else {
			successor = root
			root = root!.left
		}
	}
	
	return successor
}

// space complexity: O(N)
fileprivate func inorderSuccessorON(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
	
	guard let p = p else { return nil }
	var root = root
	var stack: [TreeNode] = []
	
	while root != nil {
		if p.val == root!.val {
			if let right = root!.right {
				root = right
				continue
			}
			if let prevGreator = stack.last { return prevGreator }
			return nil
		} else if p.val < root!.val {
			stack.append(root!)
			root = root!.left
		} else {
			root = root!.right
		}
	}
	
	return stack.last
}
