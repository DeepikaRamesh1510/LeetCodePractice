import Foundation

/*
 270. Closest Binary Search Tree Value - https://leetcode.com/problems/closest-binary-search-tree-value/description/

 Given the root of a binary search tree and a target value, return the value in the BST that is closest to the target.
 
 
 
 Example 1:
 
 
 Input: root = [4,2,5,1,3], target = 3.714286
 Output: 4
 Example 2:
 
 Input: root = [1], target = 4.428571
 Output: 1
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 104].
 0 <= Node.val <= 109
 -109 <= target <= 109
 */



public class TreeNode {
	public var val: Int
	public var left: TreeNode?
	public var right: TreeNode?
	public init() { self.val = 0; self.left = nil; self.right = nil; }
	public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
	public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
		self.val = val
		self.left = left
		self.right = right
	}
}


func closestValue(_ root: TreeNode?, _ target: Double) -> Int {
	
	var root = root
	var closest: Double = root!.val.double
	
	while root != nil {
		let val = root!.val.double
		closest = abs(target - val) > abs(target - closest) ? closest : val
		root = val > target ? root!.left : root!.right
	}
	
	return Int(closest)
}

fileprivate extension Int {
	var double: Double { Double(self) }
}

