import Foundation

/*
 106. Construct Binary Tree from Inorder and Postorder Traversal - https://leetcode.com/problems/construct-binary-tree-from-inorder-and-postorder-traversal
 Given two integer arrays inorder and postorder where inorder is the inorder traversal of a binary tree and postorder is the postorder traversal of the same tree, construct and return the binary tree.
 
 
 
 Example 1:
 
 
 Input: inorder = [9,3,15,20,7], postorder = [9,15,7,20,3]
 Output: [3,9,20,null,null,15,7]
 Example 2:
 
 Input: inorder = [-1], postorder = [-1]
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

fileprivate class ConstructTree1 {
	var postIndex = 0
	var postOrder: [Int] = []
	var indexMap: [Int: Int] = [:]
	func helper(
		_ leftIndex: Int,
		_ rightIndex: Int
	) -> TreeNode? {
		if leftIndex > rightIndex { return nil }
		let rootVal = postOrder[postIndex]
		let root = TreeNode(rootVal)
		postIndex -= 1
		let index = indexMap[rootVal]!
		root.right = helper(index + 1, rightIndex)
		root.left = helper(leftIndex, index - 1)
		return root
	}
	
	func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
		indexMap = {
			var map: [Int: Int] = [:]
			for i in (0..<inorder.count) {
				map[inorder[i]] = i
			}
			return map
		}()
		postIndex = inorder.count - 1
		postOrder = postorder
		return helper(0, inorder.count - 1)
	}
}
