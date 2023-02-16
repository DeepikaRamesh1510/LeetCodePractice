import Foundation

/*
 475. Heaters - https://leetcode.com/problems/heaters/
 Winter is coming! During the contest, your first job is to design a standard heater with a fixed warm radius to warm all the houses.
 
 Every house can be warmed, as long as the house is within the heater's warm radius range.
 
 Given the positions of houses and heaters on a horizontal line, return the minimum radius standard of heaters so that those heaters could cover all houses.
 
 Notice that all the heaters follow your radius standard, and the warm radius will the same.
 
 
 
 Example 1:
 
 Input: houses = [1,2,3], heaters = [2]
 Output: 1
 Explanation: The only heater was placed in the position 2, and if we use the radius 1 standard, then all the houses can be warmed.
 Example 2:
 
 Input: houses = [1,2,3,4], heaters = [1,4]
 Output: 1
 Explanation: The two heater was placed in the position 1 and 4. We need to use radius 1 standard, then all the houses can be warmed.
 Example 3:
 
 Input: houses = [1,5], heaters = [2]
 Output: 3
 
 
 Constraints:
 
 1 <= houses.length, heaters.length <= 3 * 104
 1 <= houses[i], heaters[i] <= 109
 */

func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {

	let sortedHeater = heaters.sorted()
	var minRadiusRequired: Int = 0

	for target in houses {
		let currentRadius = abs(findClosest(sortedHeater, target) - target)
		minRadiusRequired = max(minRadiusRequired, currentRadius)
	}

	return minRadiusRequired
}

func findClosest(_ array: [Int], _ target: Int) -> Int {

	if target <= array[0] { return array[0] }

	if target >= array[array.count - 1] { return array[array.count - 1] }

	var left = 0
	var right = array.count - 1

	while left < right {
		let mid = (left + right) / 2

		if array[mid] == target {
			return array[mid]
		} else if array[mid] > target {
			if mid > 0 && array[mid - 1] < target {
				return abs(target - array[mid]) > abs(target - array[mid - 1]) ? array[mid - 1] : array[mid]
			} else {
				right = mid - 1
			}
		} else {
			if mid < array.count - 1 && array[mid + 1] > target {
				return abs(target - array[mid]) > abs(target - array[mid + 1]) ? array[mid + 1] : array[mid]
			} else {
				left = mid + 1
			}
		}
	}

	return array[left]
}

func getNearestValue(_ value1: Int, value2: Int, _ target: Int) -> Int {
	return abs(target - value1) > abs(target - value2) ? value2 : value1
}


func findRadius(_ houses: [Int], _ heaters: [Int]) -> Int {

	let sortedHouse = houses.sorted()
	let sortedHeaters = heaters.sorted()
	var radius: [Int] = Array(repeating: Int.max, count: houses.count)

	var i = 0
	var j = 0

	while i < houses.count && j < heaters.count {

		if sortedHouse[i] <= sortedHeaters[j] {
			radius[i] = sortedHeaters[j] - sortedHouse[i]
			i += 1
		} else {
			j += 1
		}
	}

	i = houses.count - 1
	j = heaters.count - 1

	while i >= 0 && j >= 0 {
		if sortedHouse[i] >= sortedHeaters[j] {
			radius[i] = min(radius[i], sortedHouse[i] - sortedHeaters[j])
			i -= 1
		} else {
			j -= 1
		}
	}

	return radius.max() ?? 0
}

//findRadius([1,2,3,5,15], [2,30])
