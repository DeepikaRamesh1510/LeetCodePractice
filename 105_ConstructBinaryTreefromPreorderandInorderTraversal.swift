import Foundation

/*
 105. Construct Binary Tree from Preorder and Inorder Traversal - https://leetcode.com/problems/construct-binary-tree-from-preorder-and-inorder-traversal/description/
 Given two integer arrays preorder and inorder where preorder is the preorder traversal of a binary tree and inorder is the inorder traversal of the same tree, construct and return the binary tree.
 
 
 
 Example 1:
 
 
 Input: preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
 Output: [3,9,20,null,null,15,7]
 Example 2:
 
 Input: preorder = [-1], inorder = [-1]
 Output: [-1]
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

fileprivate class ConstructTree2 {
	
	var preOrderIndex = 0
	var indexMap: [Int: Int] = [:]
	var preOrder: [Int] = []
	func helper(_ leftIndex: Int, _ rightIndex: Int) -> TreeNode? {
		if leftIndex > rightIndex { return nil }
		
		let rootVal = preOrder[preOrderIndex]
		let root = TreeNode(rootVal)
		let index = indexMap[rootVal]!
		preOrderIndex += 1
		root.left = helper(leftIndex, index - 1)
		root.right = helper(index + 1, rightIndex)
		return root
	}
	
	func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
		indexMap = {
			var map: [Int: Int] = [:]
			for i in 0..<inorder.count {
				map[inorder[i]] = i
			}
			return map
		}()
		preOrder = preorder
		return helper(0, inorder.count - 1)
	}
}
