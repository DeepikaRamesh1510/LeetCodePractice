import Foundation

/*
 225. Implement Stack using Queues - https://leetcode.com/problems/implement-stack-using-queues/description/
 Implement a last-in-first-out (LIFO) stack using only two queues. The implemented stack should support all the functions of a normal stack (push, top, pop, and empty).
 
 Implement the MyStack class:
 
 void push(int x) Pushes element x to the top of the stack.
 int pop() Removes the element on the top of the stack and returns it.
 int top() Returns the element on the top of the stack.
 boolean empty() Returns true if the stack is empty, false otherwise.
 Notes:
 
 You must use only standard operations of a queue, which means that only push to back, peek/pop from front, size and is empty operations are valid.
 Depending on your language, the queue may not be supported natively. You may simulate a queue using a list or deque (double-ended queue) as long as you use only a queue's standard operations.
 
 
 Example 1:
 
 Input
 ["MyStack", "push", "push", "top", "pop", "empty"]
 [[], [1], [2], [], [], []]
 Output
 [null, null, null, 2, 2, false]
 
 Explanation
 MyStack myStack = new MyStack();
 myStack.push(1);
 myStack.push(2);
 myStack.top(); // return 2
 myStack.pop(); // return 2
 myStack.empty(); // return False
 
 
 Constraints:
 
 1 <= x <= 9
 At most 100 calls will be made to push, pop, top, and empty.
 All the calls to pop and top are valid.
 
 
 Follow-up: Can you implement the stack using only one queue?
 */

class MyStackWith1Queue {
	var q1: [Int] = []
	
	init() {
		
	}
	
	func push(_ x: Int) {
		q1.append(x)
		var size = q1.count - 1
		while size > 0 {
			//   print(size, q1)
			q1.append(q1.removeFirst())
			size -= 1
		}
	}
	
	func pop() -> Int {
		return q1.removeFirst()
	}
	
	func top() -> Int {
		return q1.first ?? 0
	}
	
	func empty() -> Bool {
		return q1.isEmpty
	}
}

class MyStackWith2Queues {
	var q1: [Int] = []
	var q2: [Int] = []
	init() {
		
	}
	
	func push(_ x: Int) {
		q1.append(x)
	}
	
	func pop() -> Int {
		
		while q1.count > 1 {
			q2.append(q1.removeFirst())
		}
		let element = q1.removeFirst()
		q1 = q2
		q2 = []
		return element
	}
	
	func top() -> Int {
		while q1.count > 1 {
			q2.append(q1.removeFirst())
		}
		let element = q1.removeFirst()
		q2.append(element)
		q1 = q2
		q2 = []
		return element
	}
	
	func empty() -> Bool {
		return q1.isEmpty
	}
}
