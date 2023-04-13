import Foundation

/*
 173. Binary Search Tree Iterator - https://leetcode.com/problems/binary-search-tree-iterator/description/
 Implement the BSTIterator class that represents an iterator over the in-order traversal of a binary search tree (BST):
 
 BSTIterator(TreeNode root) Initializes an object of the BSTIterator class. The root of the BST is given as part of the constructor. The pointer should be initialized to a non-existent number smaller than any element in the BST.
 boolean hasNext() Returns true if there exists a number in the traversal to the right of the pointer, otherwise returns false.
 int next() Moves the pointer to the right, then returns the number at the pointer.
 Notice that by initializing the pointer to a non-existent smallest number, the first call to next() will return the smallest element in the BST.
 
 You may assume that next() calls will always be valid. That is, there will be at least a next number in the in-order traversal when next() is called.
 
 
 
 Example 1:
 
 
 Input
 ["BSTIterator", "next", "next", "hasNext", "next", "hasNext", "next", "hasNext", "next", "hasNext"]
 [[[7, 3, 15, null, null, 9, 20]], [], [], [], [], [], [], [], [], []]
 Output
 [null, 3, 7, true, 9, true, 15, true, 20, false]
 
 Explanation
 BSTIterator bSTIterator = new BSTIterator([7, 3, 15, null, null, 9, 20]);
 bSTIterator.next();    // return 3
 bSTIterator.next();    // return 7
 bSTIterator.hasNext(); // return True
 bSTIterator.next();    // return 9
 bSTIterator.hasNext(); // return True
 bSTIterator.next();    // return 15
 bSTIterator.hasNext(); // return True
 bSTIterator.next();    // return 20
 bSTIterator.hasNext(); // return False
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [1, 105].
 0 <= Node.val <= 106
 At most 105 calls will be made to hasNext, and next.
 
 
 Follow up:
 
 Could you implement next() and hasNext() to run in average O(1) time and use O(h) memory, where h is the height of the tree?
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

fileprivate class BSTIterator {
	var stack: [TreeNode] = []
	
	init(_ root: TreeNode?) {
		pushLeftMostNodes(root)
	}
	
	func pushLeftMostNodes(_ root: TreeNode?) {
		var root = root
		while root != nil {
			// print(root!.val)
			stack.append(root!)
			root = root!.left
		}
	}
	
	func next() -> Int {
		let top = stack.removeLast()
		//    print(top.val)
		if let right = top.right {
			pushLeftMostNodes(right)
		}
		return top.val
	}
	
	func hasNext() -> Bool {
		return stack.count > 0
	}
}


fileprivate class BSTIterator2 {
	var queue: [TreeNode] = []
	
	init(_ root: TreeNode?) {
		var stack: [TreeNode] = []
		var root = root
		
		while !stack.isEmpty || root != nil {
			while root != nil {
				stack.append(root!)
				root = root!.left
			}
			
			root = stack.removeLast()
			if let root = root {
				queue.append(root)
			}
			root = root?.right
		}
	}
	
	func next() -> Int {
		guard hasNext() else { fatalError() }
		return queue.removeFirst().val
	}
	
	func hasNext() -> Bool {
		return queue.count > 0
	}
}
