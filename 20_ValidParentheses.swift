import Foundation

/*
 20. Valid Parentheses- https://leetcode.com/problems/valid-parentheses/description/
 Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
 
 An input string is valid if:
 
 Open brackets must be closed by the same type of brackets.
 Open brackets must be closed in the correct order.
 Every close bracket has a corresponding open bracket of the same type.
 
 
 Example 1:
 
 Input: s = "()"
 Output: true
 Example 2:
 
 Input: s = "()[]{}"
 Output: true
 Example 3:
 
 Input: s = "(]"
 Output: false
 
 
 Constraints:
 
 1 <= s.length <= 104
 s consists of parentheses only '()[]{}'.
 */

func isValidUsingStack(_ string: String) -> Bool {
	let data: [Character] = Array(string)
	var stack: [Character] = []
	
	for i in (0..<data.count) {
		if data[i] == "[" || data[i] == "{" || data[i] == "(" {
			stack.append(data[i])
		} else {
			guard !stack.isEmpty else { return false }
			let lastChar = stack.removeLast()
			switch data[i] {
				case "]" where lastChar == "[":
					break
				case "}" where lastChar == "{":
					break
				case ")" where lastChar == "(":
					break
				default:
					return false
			}
		}
	}
	return stack.isEmpty
}

func isValid(_ string: String) -> Bool {
	var string = string
	let stringCount = string.count
	let float10Pow4: Float = pow(10, 4)
	guard stringCount >= 1, stringCount < Int64(float10Pow4) else { return false }
	
	let openingBrackets = "[{("
	let closingBrackets = ")}]"
	
	guard Set(openingBrackets + closingBrackets).isSuperset(of: string) else { return false }
	
	var validatorString = ""
	
	repeat {
		let char = string.removeFirst()
		if openingBrackets.contains(char) {
			validatorString += String(char)
		} else {
			let lastChar = validatorString.popLast()
			switch lastChar {
				case .some(lastChar):
					switch char {
						case ")" where lastChar == "(": break
						case "]" where lastChar == "[": break
						case "}" where lastChar == "{": break
						default: return false
					}
				default:
					return false
			}
		}
	} while(string.count > 0)
	
	return validatorString.count == 0
}
