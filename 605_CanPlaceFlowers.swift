import Foundation

/*
 605. Can Place Flowers - https://leetcode.com/problems/can-place-flowers/description/
 
 You have a long flowerbed in which some of the plots are planted, and some are not. However, flowers cannot be planted in adjacent plots.
 
 Given an integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and an integer n, return if n new flowers can be planted in the flowerbed without violating the no-adjacent-flowers rule.
 
 
 
 Example 1:
 
 Input: flowerbed = [1,0,0,0,1], n = 1
 Output: true
 Example 2:
 
 Input: flowerbed = [1,0,0,0,1], n = 2
 Output: false
 
 
 Constraints:
 
 1 <= flowerbed.length <= 2 * 104
 flowerbed[i] is 0 or 1.
 There are no two adjacent flowers in flowerbed.
 0 <= n <= flowerbed.length
 */


func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
	
	var flowerbed = flowerbed
	var count = 0
	
	for i in (0..<flowerbed.count) where flowerbed[i] == 0 {
		let isLeftEmpty = i == 0 || flowerbed[i - 1] == 0
		let isRightEmpty = i == flowerbed.count - 1 || flowerbed[i + 1] == 0
		
		guard isLeftEmpty && isRightEmpty else { continue }
		
		flowerbed[i] = 1
		count += 1
		
		if count >= n { return true }
	}
	
	return count >= n
	}
