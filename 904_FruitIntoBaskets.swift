import Foundation

/*
 904. Fruit Into Baskets
 
 You are visiting a farm that has a single row of fruit trees arranged from left to right. The trees are represented by an integer array fruits where fruits[i] is the type of fruit the ith tree produces.
 
 You want to collect as much fruit as possible. However, the owner has some strict rules that you must follow:
 
 You only have two baskets, and each basket can only hold a single type of fruit. There is no limit on the amount of fruit each basket can hold.
 Starting from any tree of your choice, you must pick exactly one fruit from every tree (including the start tree) while moving to the right. The picked fruits must fit in one of your baskets.
 Once you reach a tree with fruit that cannot fit in your baskets, you must stop.
 Given the integer array fruits, return the maximum number of fruits you can pick.
 
 
 
 Example 1:
 
 Input: fruits = [1,2,1]
 Output: 3
 Explanation: We can pick from all 3 trees.
 Example 2:
 
 Input: fruits = [0,1,2,2]
 Output: 3
 Explanation: We can pick from trees [1,2,2].
 If we had started at the first tree, we would only pick from trees [0,1].
 Example 3:
 
 Input: fruits = [1,2,3,2,2]
 Output: 4
 Explanation: We can pick from trees [2,3,2,2].
 If we had started at the first tree, we would only pick from trees [1,2].
 
 
 Constraints:
 
 1 <= fruits.length <= 105
 0 <= fruits[i] < fruits.length
 */


func totalFruit(_ fruits: [Int]) -> Int {
	guard fruits.count > 2 else { return fruits.count }
	
	var left = 0
	var maxPicked: Int = 0
	var bucket: [Int: Int] = [:]
	
	for i in (0..<fruits.count) {
		bucket[fruits[i]] = bucket[fruits[i]] == nil ? 1 : bucket[fruits[i]]! + 1
		
		while bucket.count > 2 {
			
			bucket[fruits[left]] = bucket[fruits[left]] == nil ? 0 : bucket[fruits[left]]! - 1
			if bucket[fruits[left]] == 0 {
				bucket[fruits[left]] = nil
			}
			left += 1
		}
		
		maxPicked = max(maxPicked, i - left + 1)
	}
	
	return maxPicked
}

//print(totalFruit([3,3,3,1,2,1,1,2,3,3,4]))
