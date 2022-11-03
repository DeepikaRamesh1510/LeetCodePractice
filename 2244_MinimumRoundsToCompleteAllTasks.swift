import Foundation

/*
 2244. Minimum Rounds to Complete All Tasks
 
 You are given a 0-indexed integer array tasks, where tasks[i] represents the difficulty level of a task. In each round, you can complete either 2 or 3 tasks of the same difficulty level.
 
 Return the minimum rounds required to complete all the tasks, or -1 if it is not possible to complete all the tasks.
 
 
 
 Example 1:
 
 Input: tasks = [2,2,3,3,2,4,4,4,4,4]
 Output: 4
 Explanation: To complete all the tasks, a possible plan is:
 - In the first round, you complete 3 tasks of difficulty level 2.
 - In the second round, you complete 2 tasks of difficulty level 3.
 - In the third round, you complete 3 tasks of difficulty level 4.
 - In the fourth round, you complete 2 tasks of difficulty level 4.
 It can be shown that all the tasks cannot be completed in fewer than 4 rounds, so the answer is 4.
 */


func minimumRounds(_ tasks: [Int]) -> Int {
	var taskMap: [Int: Int] = [:]
	
	for i in tasks {
		if let count = taskMap[i] {
			taskMap[i] = count + 1
		} else {
			taskMap[i] = 1
		}
	}
	
	var minRounds = 0
	
	for num in taskMap {
		let count = num.value
		if count == 1 {
			minRounds = -1
			break
		}
		let divBy3: Int = count/3
		minRounds += count % 3 == 0 ? divBy3 : divBy3 + 1
	}
	return minRounds
}

