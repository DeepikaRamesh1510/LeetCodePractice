import Foundation

/*
 145. Binary Tree Postorder Traversal - https://leetcode.com/problems/binary-tree-postorder-traversal/
 Given the root of a binary tree, return the postorder traversal of its nodes' values.
 
 
 
 Example 1:
 
 
 Input: root = [1,null,2,3]
 Output: [3,2,1]
 Example 2:
 
 Input: root = []
 Output: []
 Example 3:
 
 Input: root = [1]
 Output: [1]
 
 
 Constraints:
 
 The number of the nodes in the tree is in the range [0, 100].
 -100 <= Node.val <= 100
 
 
 Follow up: Recursive solution is trivial, could you do it iteratively?
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

fileprivate func postorderTraversalIterative(_ root: TreeNode?) -> [Int] {
	var node = root
	var stack: [TreeNode] = []
	var prev: TreeNode? = nil
	var result: [Int] = []
	
	while node != nil || !stack.isEmpty {
		// print(node?.val)
		if node != nil {
			stack.append(node!)
			node = node?.left
			// print("if block : - \(node?.val), stack - \(stack)")
		} else {
			node = stack.last
			// print("if else block : - \(node?.val)")
			if node!.right == nil || node!.right == prev {
				// print("if if block : - \(node?.val)")
				result.append(node!.val)
				stack.removeLast()
				prev = node
				node = nil
				// print("result: ", result)
			} else {
				// print("if if else block : - \(node?.val)")
				node = node?.right
			}
		}
	}
	
	return result
}

extension TreeNode: Equatable {
	public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
		return lhs.val == rhs.val && lhs.right == rhs.right && lhs.left == rhs.left
	}
}

//Recursive
fileprivate func postorderTraversal(_ root: TreeNode?) -> [Int] {
	var result: [Int] = []
	guard let node = root else { return [] }
	postTraversal(node, &result)
	return result
}

fileprivate func postTraversal(_ node: TreeNode?, _ result: inout [Int]) {
	guard let node = node else { return  }
	postTraversal(node.left, &result)
	postTraversal(node.right, &result)
	result.append(node.val)
}
