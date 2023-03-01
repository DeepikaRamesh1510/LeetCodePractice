import Foundation

/*
 876. Middle of the Linked List - https://leetcode.com/problems/middle-of-the-linked-list
 
 Given the head of a singly linked list, return the middle node of the linked list.
 
 If there are two middle nodes, return the second middle node.
 
 
 
 Example 1:
 
 
 Input: head = [1,2,3,4,5]
 Output: [3,4,5]
 Explanation: The middle node of the list is node 3.
 Example 2:
 
 
 Input: head = [1,2,3,4,5,6]
 Output: [4,5,6]
 Explanation: Since the list has two middle nodes with values 3 and 4, we return the second one.
 
 
 Constraints:
 
 The number of nodes in the list is in the range [1, 100].
 1 <= Node.val <= 100
 */


fileprivate class ListNode {
	var val: Int
	var next: ListNode?
	init() { self.val = 0; self.next = nil; }
	init(_ val: Int) { self.val = val; self.next = nil; }
	init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

fileprivate func middleNode(_ head: ListNode?) -> ListNode? {
	var slow = head
	var fast = head
	
	while fast != nil && fast?.next != nil {
		slow = slow?.next
		fast = fast?.next?.next
	}
	
	return slow
}

fileprivate func middleNode1(_ head: ListNode?) -> ListNode? {
	
	var head: ListNode? = head
	var counter = 0
	var tempHead: ListNode? = head
	
	while tempHead != nil {
		counter += 1
		tempHead = tempHead?.next
	}
	
	counter = (counter + (counter % 2 == 0 ? 2 : 0)) / 2
	
	while counter > 0 {
		head = head?.next
		counter -= 1
	}
	
	return head
}
