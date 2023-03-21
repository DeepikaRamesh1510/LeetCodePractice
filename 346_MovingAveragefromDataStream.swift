import Foundation

/*
 346. Moving Average from Data Stream - https://leetcode.com/problems/moving-average-from-data-stream
 
 Given a stream of integers and a window size, calculate the moving average of all integers in the sliding window.
 
 Implement the MovingAverage class:
 
 MovingAverage(int size) Initializes the object with the size of the window size.
 double next(int val) Returns the moving average of the last size values of the stream.
 
 
 Example 1:
 
 Input
 ["MovingAverage", "next", "next", "next", "next"]
 [[3], [1], [10], [3], [5]]
 Output
 [null, 1.0, 5.5, 4.66667, 6.0]
 
 Explanation
 MovingAverage movingAverage = new MovingAverage(3);
 movingAverage.next(1); // return 1.0 = 1 / 1
 movingAverage.next(10); // return 5.5 = (1 + 10) / 2
 movingAverage.next(3); // return 4.66667 = (1 + 10 + 3) / 3
 movingAverage.next(5); // return 6.0 = (10 + 3 + 5) / 3
 
 
 Constraints:
 
 1 <= size <= 1000
 -105 <= val <= 105
 At most 104 calls will be made to next.
 */

class MovingAverage {
	
	var data: [Double]
	var count: Int = 0
	var startIndex = 0
	var endIndex = 0
	var sum: Double = 0
	
	init(_ size: Int) {
		data = Array(repeating: 0, count: size)
	}
	
	func next(_ val: Int) -> Double {
		
		if count == data.count {
			sum -= data[startIndex]
			startIndex = (startIndex + 1) % data.count
		} else {
			count += 1
		}
		
		endIndex = (endIndex + 1) % data.count
		data[endIndex] = Double(val)
		sum += data[endIndex]
		return sum / Double(count)
	}
}

/**
 * Your MovingAverage object will be instantiated and called as such:
 * let obj = MovingAverage(size)
 * let ret_1: Double = obj.next(val)
 */
