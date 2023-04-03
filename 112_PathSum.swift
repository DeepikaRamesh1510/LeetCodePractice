import Foundation

/*
 112. Path Sum - https://leetcode.com/problems/path-sum/description/
 
 Given the root of a binar y tree and an integer targetSum, return true if the tree has a root-to-leaf path such that adding up all the values along the path equals targetSum.
 
 A leaf is a node with no children.
 
 
 
 Example 1:
 
 
 Input: root = [5,4,8,11,null,13,4,7,2,null,null,null,1], targetSum = 22
 Output: true
 Explanation: The root-to-leaf path with the target sum is shown.
 Example 2:
 
 
 Input: root = [1,2,3], targetSum = 5
 Output: false
 Explanation: There two root-to-leaf paths in the tree:
 (1 --> 2): The sum is 3.
 (1 --> 3): The sum is 4.
 There is no root-to-leaf path with sum = 5.
 Example 3:
 
 Input: root = [], targetSum = 0
 Output: false
 Explanation: Since the tree is empty, there are no root-to-leaf paths.
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 5000].
 -1000 <= Node.val <= 1000
 -1000 <= targetSum <= 1000
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

fileprivate func hasPathSumIteration(_ root: TreeNode?, _ targetSum: Int) -> Bool {
	guard let node = root else { return false }
	var stack: [(TreeNode, Int)] = []
	stack.append((node, node.val))
	
	while !stack.isEmpty {
		let element = stack.removeLast()
		if element.0.left == nil && element.0.right == nil && targetSum == element.1 {
			return true
		}
		
		if let left = element.0.left {
			stack.append((left, element.1 + left.val))
		}
		if let right = element.0.right {
			stack.append((right, element.1 + right.val))
		}
	}
	
	return false
}

fileprivate func hasPathSumRecursive(_ root: TreeNode?, _ targetSum: Int, _ total: Int = 0) -> Bool {
	guard let node = root else { return false }
	if node.left == nil && node.right == nil { return targetSum == total + node.val }
	
	return hasPathSumRecursive(node.left, targetSum, total + node.val) || hasPathSumRecursive(node.right, targetSum, total + node.val)
}
