import Foundation

/*
 889. Construct Binary Tree from Preorder and Postorder Traversal - https://leetcode.com/problems/construct-binary-tree-from-preorder-and-postorder-traversal/description/
 Given two integer arrays, preorder and postorder where preorder is the preorder traversal of a binary tree of distinct values and postorder is the postorder traversal of the same tree, reconstruct and return the binary tree.
 
 If there exist multiple answers, you can return any of them.
 
 
 
 Example 1:
 
 
 Input: preorder = [1,2,4,5,3,6,7], postorder = [4,5,2,6,7,3,1]
 Output: [1,2,3,4,5,6,7]
 Example 2:
 
 Input: preorder = [1], postorder = [1]
 Output: [1]
 
 
 Constraints:
 
 1 <= preorder.length <= 30
 1 <= preorder[i] <= preorder.length
 All the values of preorder are unique.
 postorder.length == preorder.length
 1 <= postorder[i] <= postorder.length
 All the values of postorder are unique.
 It is guaranteed that preorder and postorder are the preorder traversal and postorder traversal of the same binary tree.
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

fileprivate class ConstructTree3 {
	var pIndex = 0
	var map: [Int: Int] = [:]
	var preOrder: [Int] = []
	
	func helper(_ leftIndex: Int, _ rightIndex: Int) -> TreeNode? {
		
		if leftIndex > rightIndex || pIndex > preOrder.count - 1  { return nil }
		let rootVal = preOrder[pIndex]
		let root = TreeNode(rootVal)
		pIndex += 1
		if leftIndex == rightIndex || pIndex > preOrder.count - 1 { return root }
		
		let index = map[preOrder[pIndex]]!
		root.left = helper(leftIndex, index)
		root.right = helper(index + 1, rightIndex - 1)
		return root
	}
	
	func constructFromPrePost(_ preorder: [Int], _ postorder: [Int]) -> TreeNode? {
		map = {
			var map: [Int: Int] = [:]
			for i in 0..<postorder.count {
				map[postorder[i]] = i
			}
			return map
		}()
		preOrder = preorder
		return helper(0, postorder.count - 1)
	}
}
