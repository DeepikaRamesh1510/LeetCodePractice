import Foundation

/*
 114. Flatten Binary Tree to Linked List - https://leetcode.com/problems/flatten-binary-tree-to-linked-list/description/
 Given the root of a binary tree, flatten the tree into a "linked list":
 
 The "linked list" should use the same TreeNode class where the right child pointer points to the next node in the list and the left child pointer is always null.
 The "linked list" should be in the same order as a pre-order traversal of the binary tree.
 
 
 Example 1:
 
 
 Input: root = [1,2,5,3,4,null,6]
 Output: [1,null,2,null,3,null,4,null,5,null,6]
 Example 2:
 
 Input: root = []
 Output: []
 Example 3:
 
 Input: root = [0]
 Output: [0]
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 2000].
 -100 <= Node.val <= 100
 
 
 Follow up: Can you flatten the tree in-place (with O(1) extra space)?
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


fileprivate func flatten(_ root: TreeNode?) {
	var array: [TreeNode] = []
	var stack: [TreeNode] = []
	var node = root
	
	while node != nil || !stack.isEmpty {
		while node != nil {
			stack.append(node!)
			array.append(node!)
			node = node!.left
		}
		
		node = stack.removeLast().right
	}
	
	for i in (0..<array.count) {
		array[i].left = nil
		if i < array.count - 1 {
			array[i].right = array[i + 1]
		}
	}
}


fileprivate func flattenSpaceO_1(_ root: TreeNode?) {
	var node = root
	var pointer = root
	
	while pointer != nil {
		//    print(pointer!.val, "outer")
		if pointer!.left != nil {
//			let newRight = pointer!.left
			
			node = pointer!.left
			
			while node!.right != nil {
				//    print(node!.val, "inner")
				node = node!.right
			}
			
			node!.right = pointer!.right
			pointer!.right = pointer!.left
			pointer!.left = nil
		}
		pointer = pointer!.right
	}
}
