import Foundation

/*
 701. Insert into a Binary Search Tree - https://leetcode.com/problems/insert-into-a-binary-search-tree/description/
 You are given the root node of a binary search tree (BST) and a value to insert into the tree. Return the root node of the BST after the insertion. It is guaranteed that the new value does not exist in the original BST.
 
 Notice that there may exist multiple valid ways for the insertion, as long as the tree remains a BST after insertion. You can return any of them.
 
 
 
 Example 1:
 
 
 Input: root = [4,2,7,1,3], val = 5
 Output: [4,2,7,1,3,5]
 Explanation: Another accepted tree is:
 
 Example 2:
 
 Input: root = [40,20,60,10,30,50,70], val = 25
 Output: [40,20,60,10,30,50,70,null,null,25]
 Example 3:
 
 Input: root = [4,2,7,1,3,null,null,null,null,null,null], val = 5
 Output: [4,2,7,1,3,5]
 
 
 Constraints:
 
 The number of nodes in the tree will be in the range [0, 104].
 -108 <= Node.val <= 108
 All the values Node.val are unique.
 -108 <= val <= 108
 It's guaranteed that val does not exist in the original BST.
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


fileprivate func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
	var node = root
	var prev: TreeNode? = nil
	
	while node != nil {
		prev = node
		node = node!.val < val ? node!.right : node!.left
	}
	
	let newNode = TreeNode(val)
	if let prev = prev {
		if prev.val < val {
			prev.right = newNode
		} else {
			prev.left = newNode
		}
	} else {
		return newNode
	}
	return root
}
