import Foundation

/*
 19. Remove Nth Node From End of List - https://leetcode.com/problems/remove-nth-node-from-end-of-list
 
 Given the head of a linked list, remove the nth node from the end of the list and return its head.
 
 
 
 Example 1:
 
 
 Input: head = [1,2,3,4,5], n = 2
 Output: [1,2,3,5]
 Example 2:
 
 Input: head = [1], n = 1
 Output: []
 Example 3:
 
 Input: head = [1,2], n = 1
 Output: [1]
 
 
 Constraints:
 
 The number of nodes in the list is sz.
 1 <= sz <= 30
 0 <= Node.val <= 100
 1 <= n <= sz
 
 
 Follow up: Could you do this in one pass?
 */


fileprivate class ListNode {
	var val: Int
	var next: ListNode?
	init() { self.val = 0; self.next = nil; }
	init(_ val: Int) { self.val = val; self.next = nil; }
	init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

fileprivate func getCount(_ head: ListNode?) -> Int {
	
	if head == nil { return 0 }
	var counter = 0
	var tempHead: ListNode? = head
	
	while tempHead != nil {
		counter += 1
		tempHead = tempHead?.next
	}
	
	return counter
}

// Two pass

fileprivate func removeNthFromEnd1(_ head: ListNode?, _ n: Int) -> ListNode? {
	
	var count = getCount(head) - n
	let dummyNode = ListNode()
	dummyNode.next = head
	var tempHead: ListNode? = dummyNode
	
	while count > 0 {
		tempHead = tempHead?.next
		count -= 1
	}
	
	tempHead?.next = tempHead?.next?.next
	return dummyNode.next
}

// One pass

fileprivate func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
	let dummyNode: ListNode? = ListNode()
	dummyNode?.next = head
	var firstPointer = dummyNode
	var secondPointer = dummyNode
	
	for _ in (0...n) {
		firstPointer = firstPointer?.next
	}
	
	while firstPointer != nil {
		firstPointer = firstPointer?.next
		secondPointer = secondPointer?.next
	}
	
	secondPointer?.next = secondPointer?.next?.next
	return dummyNode?.next
}
