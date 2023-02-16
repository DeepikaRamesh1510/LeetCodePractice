import Foundation

/*
 911. Online Election - https://leetcode.com/problems/online-election/description/
 
 You are given two integer arrays persons and times. In an election, the ith vote was cast for persons[i] at time times[i].
 
 For each query at a time t, find the person that was leading the election at time t. Votes cast at time t will count towards our query. In the case of a tie, the most recent vote (among tied candidates) wins.
 
 Implement the TopVotedCandidate class:
 
 TopVotedCandidate(int[] persons, int[] times) Initializes the object with the persons and times arrays.
 int q(int t) Returns the number of the person that was leading the election at time t according to the mentioned rules.
 
 
 Example 1:
 
 Input
 ["TopVotedCandidate", "q", "q", "q", "q", "q", "q"]
 [[[0, 1, 1, 0, 0, 1, 0], [0, 5, 10, 15, 20, 25, 30]], [3], [12], [25], [15], [24], [8]]
 Output
 [null, 0, 1, 1, 0, 0, 1]
 
 Explanation
 TopVotedCandidate topVotedCandidate = new TopVotedCandidate([0, 1, 1, 0, 0, 1, 0], [0, 5, 10, 15, 20, 25, 30]);
 topVotedCandidate.q(3); // return 0, At time 3, the votes are [0], and 0 is leading.
 topVotedCandidate.q(12); // return 1, At time 12, the votes are [0,1,1], and 1 is leading.
 topVotedCandidate.q(25); // return 1, At time 25, the votes are [0,1,1,0,0,1], and 1 is leading (as ties go to the most recent vote.)
 topVotedCandidate.q(15); // return 0
 topVotedCandidate.q(24); // return 0
 topVotedCandidate.q(8); // return 1
 
 
 
 Constraints:
 
 1 <= persons.length <= 5000
 times.length == persons.length
 0 <= persons[i] < persons.length
 0 <= times[i] <= 109
 times is sorted in a strictly increasing order.
 times[0] <= t <= 109
 At most 104 calls will be made to q.
 */



class TopVotedCandidate {
	
	var electionDetails: [(time: Int, currentLeader: Int)] = []
	
	init(_ persons: [Int], _ times: [Int]) {
		initialize(persons, times)
	}
	
	func q(_ t: Int) -> Int {
		
		var left = 0
		var right = electionDetails.count - 1
		
		while left <= right {
			let mid = (left + right) / 2
			
			if electionDetails[mid].time == t {
				return electionDetails[mid].currentLeader
			} else if t < electionDetails[mid].time {
				right = mid - 1
			} else {
				left = mid + 1
			}
		}
		
		return electionDetails[right].currentLeader
	}
	
	func initialize(_ persons: [Int], _ times: [Int]) {
		var candidatesVotes: [Int: Int] = [:]
		var currentLeader: Int? = nil
		
		for i in (0..<times.count) {
			let roundWinner = persons[i]
			candidatesVotes[roundWinner] = (candidatesVotes[roundWinner] ?? 0) + 1
			currentLeader = findCurrentLeading(roundWinner)
			electionDetails.append((times[i], currentLeader!))
		}
		
		func findCurrentLeading(_ roundWinner: Int) -> Int {
			let max = candidatesVotes.max(by: {$0.value < $1.value})
			let maxValue = max?.value ?? 0
			let allMaxValues = candidatesVotes.filter({ $0.value == maxValue })
			
			if allMaxValues.count > 1 {
				if allMaxValues.contains(where: {$0.key == roundWinner }) { return roundWinner }
				if let currentLeader = currentLeader, allMaxValues.contains(where: { $0.0 == currentLeader}) { return currentLeader }
				return allMaxValues.first?.key ?? 0
			} else {
				return max?.key ?? 0
			}
		}
	}
}

//BruteForce - TLE

class TopVotedCandidate1 {

	var electionDetails: [Int: Int] = [:]
	var firstTime: Int = 0
	var lastTime: Int = 0
	init(_ persons: [Int], _ times: [Int]) {
		firstTime = times[0]
		lastTime = times[times.count - 1]
		initializeValue(persons: persons, times: times)
	}

	func q(_ t: Int) -> Int {
		if t < firstTime { return 0 }
		if t > lastTime { return electionDetails[lastTime]! }
		return electionDetails[t]!
	}

	private func initializeValue(persons: [Int], times: [Int]) {

		var candidatesVotes: [Int: Int] = [:]
		var currentLeader: Int? = nil
		var j = 0
		for i in (0...times[times.count - 1]) {
			if i == times[j] {
				let roundWinner = persons[j]
				candidatesVotes[roundWinner] = (candidatesVotes[roundWinner] ?? 0) + 1
				currentLeader = findCurrentLeading(roundWinner)
				j += 1
			}
			electionDetails[i] = currentLeader
		}

		func findCurrentLeading(_ roundWinner: Int) -> Int {
			print(candidatesVotes)
			let max = candidatesVotes.max(by: {$0.value < $1.value})
			let maxValue = max?.value ?? 0
			let allMaxValues = candidatesVotes.filter({ $0.value == maxValue })

			if allMaxValues.count > 1 {
				if allMaxValues.contains(where: {$0.key == roundWinner }) { return roundWinner }
				if let currentLeader = currentLeader, allMaxValues.contains(where: { $0.0 == currentLeader}) { return currentLeader }
				return allMaxValues.first?.key ?? 0
			} else {
				return max?.key ?? 0
			}
		}
	}

}

//let votedCandidate = TopVotedCandidate([0,1,0,1,1], [24,29,31,76,81])
//
//votedCandidate.q(28)
//votedCandidate.q(24)
//votedCandidate.q(29)
//votedCandidate.q(77)
//votedCandidate.q(30)
//votedCandidate.q(25)
//votedCandidate.q(76)
//votedCandidate.q(75)
//votedCandidate.q(81)
//votedCandidate.q(80)

//[[[0,0,0,0,1],[0,6,39,52,75]],[45],[49],[59],[68],[42],[37],[99],[26],[78],[43]]
