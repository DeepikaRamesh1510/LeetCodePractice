import Foundation

/*
 101. Symmetric Tree - https://leetcode.com/problems/symmetric-tree/description/
 Given the root of a binary tree, check whether it is a mirror of itself (i.e., symmetric around its center).
 
 
 
 Example 1:
 
 
 Input: root = [1,2,2,3,4,4,3]
 Output: true
 Example 2:
 
 
 Input: root = [1,2,2,null,3,null,3]
 Output: false
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 1000].
 -100 <= Node.val <= 100
 
 
 Follow up: Could you solve it both recursively and iteratively?
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

fileprivate func isSymmetricIterative(_ root: TreeNode?) -> Bool {
	var stack: [TreeNode?] = [root, root]
	var result: Bool = true
	
	while !stack.isEmpty && result {
		let t1 = stack.removeLast()
		let t2 = stack.removeLast()
		if t1 == nil && t2 == nil {
			continue
		} else if t1 == nil || t2 == nil {
			return false
		} else {
			result = result && t1 == t2
			stack.append(t1!.left)
			stack.append(t2!.right)
			stack.append(t1!.right)
			stack.append(t2!.left)
		}
	}
	
	return result
}

fileprivate func isSymmetricRecursive(_ root: TreeNode?) -> Bool {
	return compareTrees(root?.left, root?.right)
}

fileprivate func compareTrees(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
	if left == nil && right == nil {
		return true
	}  else if left == nil || right == nil {
		return false
	} else {
		return left == right && compareTrees(left?.right, right?.left) && compareTrees(left?.left, right?.right)
	}
}

extension TreeNode: Equatable {
	public static func ==(lhs: TreeNode, rhs: TreeNode) -> Bool {
		return lhs.val == rhs.val //&& lhs.right == rhs.right && lhs.left == rhs.left
	}
}
