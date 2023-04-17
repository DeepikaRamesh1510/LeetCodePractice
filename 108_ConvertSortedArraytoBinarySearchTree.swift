import Foundation

/*
 108. Convert Sorted Array to Binary Search Tree - https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/description/
 Given an integer array nums where the elements are sorted in ascending order, convert it to a
 height-balanced
 binary search tree.
 
 
 
 Example 1:
 
 
 Input: nums = [-10,-3,0,5,9]
 Output: [0,-3,9,-10,null,5]
 Explanation: [0,-10,5,null,-3,null,9] is also accepted:
 
 Example 2:
 
 
 Input: nums = [1,3]
 Output: [3,1]
 Explanation: [1,null,3] and [3,1] are both height-balanced BSTs.
 
 
 Constraints:
 
 1 <= nums.length <= 104
 -104 <= nums[i] <= 104
 nums is sorted in a strictly increasing order.
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

fileprivate func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
	guard !nums.isEmpty else { return nil }
	return getBST(nums, 0, nums.count - 1)
}

fileprivate func getBST(_ nums: [Int], _ left: Int, _ right: Int) -> TreeNode? {
	// print(left, right)
	if left > right  { return nil }
	let mid = (left + right) / 2
	let node = TreeNode(nums[mid])
	node.left = getBST(nums, left, mid - 1)
	node.right = getBST(nums, mid + 1, right)
	return node
}
