import Foundation

/*
 450. Delete Node in a BST - https://leetcode.com/problems/delete-node-in-a-bst/description/
 Given a root node reference of a BST and a key, delete the node with the given key in the BST. Return the root node reference (possibly updated) of the BST.
 
 Basically, the deletion can be divided into two stages:
 
 Search for a node to remove.
 If the node is found, delete the node.
 
 
 Example 1:
 
 
 Input: root = [5,3,6,2,4,null,7], key = 3
 Output: [5,4,6,2,null,null,7]
 Explanation: Given key to delete is 3. So we find the node with value 3 and delete it.
 One valid answer is [5,4,6,2,null,null,7], shown in the above BST.
 Please notice that another valid answer is [5,2,6,null,4,null,7] and it's also accepted.
 
 Example 2:
 
 Input: root = [5,3,6,2,4,null,7], key = 0
 Output: [5,3,6,2,4,null,7]
 Explanation: The tree does not contain a node with value = 0.
 Example 3:
 
 Input: root = [], key = 0
 Output: []
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 104].
 -105 <= Node.val <= 105
 Each node has a unique value.
 root is a valid binary search tree.
 -105 <= key <= 105
 
 
 Follow up: Could you solve it with time complexity O(height of tree)?
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

fileprivate func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
	var node = root
	var prev: TreeNode?
	while node != nil && node!.val != key {
		prev = node
		node = node!.val < key ? node!.right : node!.left
	}
	
	guard node != nil else { return root }
	
	var temp: TreeNode? = nil
	
	if node?.left == nil {
		temp = node?.right
	} else if node?.right == nil {
		temp = node?.left
	} else {
		var left = node?.right
		while left?.left != nil {
			left = left?.left
		}
		
		left?.left = node?.left
		temp = node?.right
	}
	
	if prev == nil {
		return temp
	} else if prev?.left == node {
		prev?.left = temp
	} else {
		prev?.right = temp
	}
	return root
	}

fileprivate extension TreeNode: Equatable {
	public static func ==(_ lhs: TreeNode, _ rhs: TreeNode) -> Bool {
		return lhs.val == rhs.val && lhs.left == rhs.left && lhs.right == rhs.right
	}
}
