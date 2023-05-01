import Foundation

/*
 538. Convert BST to Greater Tree - https://leetcode.com/problems/convert-bst-to-greater-tree/description/
 Given the root of a Binary Search Tree (BST), convert it to a Greater Tree such that every key of the original BST is changed to the original key plus the sum of all keys greater than the original key in BST.
 
 As a reminder, a binary search tree is a tree that satisfies these constraints:
 
 The left subtree of a node contains only nodes with keys less than the node's key.
 The right subtree of a node contains only nodes with keys greater than the node's key.
 Both the left and right subtrees must also be binary search trees.
 
 
 Example 1:
 
 
 Input: root = [4,1,6,0,2,5,7,null,null,null,3,null,null,null,8]
 Output: [30,36,21,36,35,26,15,null,null,null,33,null,null,null,8]
 Example 2:
 
 Input: root = [0,null,1]
 Output: [1,null,1]
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 104].
 -104 <= Node.val <= 104
 All the values in the tree are unique.
 root is guaranteed to be a valid binary search tree.
 
 
 Note: This question is the same as 1038: https://leetcode.com/problems/binary-search-tree-to-greater-sum-tree/
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

fileprivate func convertBST(_ root: TreeNode?) -> TreeNode? {
	var node = root
	var stack: [TreeNode] = []
	var sum: Int = 0
	while node != nil || !stack.isEmpty {
		while node != nil {
			stack.append(node!)
			node = node!.right
		}
		
		node = stack.removeLast()
		sum = sum + (node?.val ?? 0)
		node?.val = sum
		node = node?.left
	}
	return root
}



extension TreeNode: Equatable {
	public static func ==(_ lhs: TreeNode,  _ rhs: TreeNode) -> Bool {
		return lhs.val == rhs.val && lhs.right == rhs.right && lhs.left == rhs.left
	}
}