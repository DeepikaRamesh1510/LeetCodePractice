import Foundation

/*
 297. Serialize and Deserialize Binary Tree - https://leetcode.com/problems/serialize-and-deserialize-binary-tree/description/
 Serialization is the process of converting a data structure or object into a sequence of bits so that it can be stored in a file or memory buffer, or transmitted across a network connection link to be reconstructed later in the same or another computer environment.
 
 Design an algorithm to serialize and deserialize a binary tree. There is no restriction on how your serialization/deserialization algorithm should work. You just need to ensure that a binary tree can be serialized to a string and this string can be deserialized to the original tree structure.
 
 Clarification: The input/output format is the same as how LeetCode serializes a binary tree. You do not necessarily need to follow this format, so please be creative and come up with different approaches yourself.
 
 
 
 Example 1:
 
 
 Input: root = [1,2,3,null,null,4,5]
 Output: [1,2,3,null,null,4,5]
 Example 2:
 
 Input: root = []
 Output: []
 
 
 Constraints:
 
 The number of nodes in the tree is in the range [0, 104].
 -1000 <= Node.val <= 1000
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

fileprivate class Codec {
	func serialize(_ root: TreeNode?) -> String {
		var serializedString: String = ""
		var stack: [TreeNode] = []
		var node = root
		while !stack.isEmpty || node != nil {
			while node != nil {
				stack.append(node!)
				serializedString = serializedString + "\(node!.val),"
				node = node!.left
			}
			serializedString = serializedString + "_,"
			// print(stack.last?.val, "popping element")
			node = stack.removeLast().right
		}
		// print(serializedString)
		return serializedString
	}
	
	
	
	func deserialize(_ data: String) -> TreeNode? {
		// print(data)
		guard !data.isEmpty else { return nil }
		var data: [String] = data.components(separatedBy: ",")
		
		func deserializeDFS() -> TreeNode? {
			// print(data)
			guard !data.isEmpty, let val = Int(String(data.removeFirst())) else { return nil }
			
			let node = TreeNode(val)
			node.left = deserializeDFS()
			node.right = deserializeDFS()
			return node
		}
		
		return deserializeDFS()
	}
}
