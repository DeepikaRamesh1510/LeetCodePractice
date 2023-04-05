import Foundation

/*
 155. Min Stack - https://leetcode.com/problems/min-stack/description/
 Design a stack that supports push, pop, top, and retrieving the minimum element in constant time.
 
 Implement the MinStack class:
 
 MinStack() initializes the stack object.
 void push(int val) pushes the element val onto the stack.
 void pop() removes the element on the top of the stack.
 int top() gets the top element of the stack.
 int getMin() retrieves the minimum element in the stack.
 You must implement a solution with O(1) time complexity for each function.
 
 
 
 Example 1:
 
 Input
 ["MinStack","push","push","push","getMin","pop","top","getMin"]
 [[],[-2],[0],[-3],[],[],[],[]]
 
 Output
 [null,null,null,null,-3,null,0,-2]
 
 Explanation
 MinStack minStack = new MinStack();
 minStack.push(-2);
 minStack.push(0);
 minStack.push(-3);
 minStack.getMin(); // return -3
 minStack.pop();
 minStack.top();    // return 0
 minStack.getMin(); // return -2
 
 
 Constraints:
 
 -231 <= val <= 231 - 1
 Methods pop, top and getMin operations will always be called on non-empty stacks.
 At most 3 * 104 calls will be made to push, pop, top, and getMin.
 */

class MinStack {
	
	var data: [Int] = []
	var minArray: [Int] = []
	
	
	init() {
		
	}
	
	func push(_ val: Int) {
		data.append(val)
		
		if minArray.isEmpty {
			minArray.append(val)
		} else {
			if minArray[minArray.count - 1] >= val {
				minArray.append(val)
			}
		}
	}
	
	func pop() {
		guard data.count > 0 else { return }
		if minArray.count > 0, minArray[minArray.count - 1] == data.removeLast() {
			minArray.removeLast()
		}
	}
	
	func top() -> Int {
		guard data.count > 0 else { return 0 }
		return data[data.count - 1]
	}
	
	func getMin() -> Int {
		guard minArray.count > 0 else { return 0 }
		return minArray[minArray.count - 1]
	}
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(val)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
