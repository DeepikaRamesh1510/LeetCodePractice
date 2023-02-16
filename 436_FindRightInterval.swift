import Foundation

/*
 436. Find Right Interval - https://leetcode.com/problems/find-right-interval/
 You are given an array of intervals, where intervals[i] = [starti, endi] and each starti is unique.
 
 The right interval for an interval i is an interval j such that startj >= endi and startj is minimized. Note that i may equal j.
 
 Return an array of right interval indices for each interval i. If no right interval exists for interval i, then put -1 at index i.
 
 
 
 Example 1:
 
 Input: intervals = [[1,2]]
 Output: [-1]
 Explanation: There is only one interval in the collection, so it outputs -1.
 Example 2:
 
 Input: intervals = [[3,4],[2,3],[1,2]]
 Output: [-1,0,1]
 Explanation: There is no right interval for [3,4].
 The right interval for [2,3] is [3,4] since start0 = 3 is the smallest start that is >= end1 = 3.
 The right interval for [1,2] is [2,3] since start1 = 2 is the smallest start that is >= end2 = 2.
 Example 3:
 
 Input: intervals = [[1,4],[2,3],[3,4]]
 Output: [-1,2,-1]
 Explanation: There is no right interval for [1,4] and [3,4].
 The right interval for [2,3] is [3,4] since start2 = 3 is the smallest start that is >= end1 = 3.
 
 
 Constraints:
 
 1 <= intervals.length <= 2 * 104
 intervals[i].length == 2
 -106 <= starti <= endi <= 106
 The start point of each interval is unique.
 */

func findRightInterval(_ intervals: [[Int]]) -> [Int] {
	
	var i = 0
	let sortedStartIndex: [(Int, Int)] = intervals.map {
		let value = ($0[0], i)
		i += 1
		return value
	}.sorted(by: { $0.0 < $1.0 })
	
	var indices: [Int] = []
	
	for element in intervals {
		let target = element[1]
		
		var left = 0
		var right = intervals.count - 1
		
		while left <= right {
			let mid = (left + right) / 2
			if sortedStartIndex[mid].0 == target {
				indices.append(sortedStartIndex[mid].1)
				break
				
			} else if sortedStartIndex[mid].0 < target {
				
				if mid < sortedStartIndex.count - 1 {
					left = mid + 1
				} else {
					indices.append(-1)
					break
				}
				
			} else {
				
				if mid > 0 && sortedStartIndex[mid - 1].0 < target {
					indices.append(sortedStartIndex[mid].1)
					break
				} else {
					right = mid - 1
				}
			}
		}
	}
	return indices
}

//findRightInterval([[2,2]])
