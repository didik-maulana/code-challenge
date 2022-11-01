import XCTest

enum CustomError: LocalizedError {
    case notAllowedNumber
    case outOfBounds
    
    var errorDescription: String? {
        switch self {
        case .notAllowedNumber:
            return "The input will only contain 0 and 1."
        case .outOfBounds:
            return "The length of input array not exceed 10.000"
        }
    }
}

/*
 Soal 1
 Given a binary array, find the maximum number of consecutive 1s in this array.
 
 Example:
 Input: [1,1,0,1,1,1]
 Output: 3

 Input: [1,0,0,1,0,1,1]
 Output: 2

 Notes:
 - The input array will only contain 0 and 1
 - The length of input array is a positive integer and will not exceed 10.000
*/
func findMaxConsecutiveNumber(input: [Int]) throws -> Int {
    guard input.count <= 10_000 else {
        throw CustomError.outOfBounds
    }
    
    var count = 0
    var maxNumber = 0
    
    for index in 0..<input.count {
        if input[index] != 0 && input[index] != 1 {
            throw CustomError.notAllowedNumber
        } else if input[index] == 0 {
            count = 0
        } else {
            count += 1
            maxNumber = max(maxNumber, count)
        }
    }
    return maxNumber
}

/*
 Soal 2
 Write a function that reverses a string using a recursive function. Input of function using char[] or array of character.
 
 Example:
 Input: ["h","e","l","l","o"]
 Output: ["o","l","l","e","h"]
 
 Notes:
 - You can’t using default function reserve
 - You can’t using looping for reserve function
 - only can use recursive for solved
*/
func reverseString(_ input: inout [Character]) {
    func recursiveReverse(_ string: inout [Character], leftIndex: Int, rightIndex: Int) {
        guard leftIndex < rightIndex else { return }
        string.swapAt(leftIndex, rightIndex)
        recursiveReverse(&string, leftIndex: leftIndex + 1, rightIndex: rightIndex - 1)
    }
    recursiveReverse(&input, leftIndex: 0, rightIndex: input.count - 1)
}

/*
 Soal 3
 Write function to find Balanced Brackets.
 Bracket is considered to be any one of the following characters: ( , ) , { , } , [ , or ].
 Check brackets matched pairs between opening bracket and close bracket with return string YES or NO.

 Example:
 
 Input: { [ ( ) ] }
 Output: YES

 Input: { [ ( ] ) }
 Output: NO
 
 Input: { ( ( [ ] ) [ ] ) [ ] }
 Output: YES
*/
extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
}

func balancedBrackets(_ input: String) -> String {
    guard input.count > 1 else {
        return "NO"
    }
    var brackets: [Character] = []
    
    for index in 0..<input.count {
        switch input[index] {
        case "(":
            brackets.append(")")
        case "{":
            brackets.append("}")
        case "[":
            brackets.append("]")
        case ")", "}", "]":
            if brackets.isEmpty || brackets.removeLast() != input[index] {
                return "NO"
            }
        default:
            break
        }
    }
    return brackets.isEmpty ? "YES" : "NO"
}

class UnitTests: XCTestCase {
    // Soal 1
    func testFindMaxConsecutiveNumberByGivenValidNumbers() throws {
        XCTAssertEqual(try findMaxConsecutiveNumber(input: [1, 1, 0, 1, 1, 1]), 3)
        XCTAssertEqual(try findMaxConsecutiveNumber(input: [1, 0, 0, 1, 0, 1, 1]), 2)
    }
    
    func testFindMaxConsecutiveNumberByGivenNotAllowedNumber() throws {
        XCTAssertThrowsError(try findMaxConsecutiveNumber(input: [1, 2, 3, 4, 5])) { error in
            XCTAssertEqual(error.localizedDescription, CustomError.notAllowedNumber.localizedDescription)
        }
    }
    
    func testFindMaxConsecutiveNumberByGivenOutOfBounds() {
        var numbers = [Int]()

        for _ in 1...10_001 {
            numbers.append(Int.random(in: 0...1))
        }

        XCTAssertThrowsError(try findMaxConsecutiveNumber(input: numbers)) { error in
            XCTAssertEqual(error.localizedDescription, CustomError.outOfBounds.localizedDescription)
        }
    }
    
    // Soal 2
    func testReverseString() {
        var input: [Character] = ["h", "e", "l", "l", "o"]
        
        reverseString(&input)
        
        XCTAssertEqual(input, ["o", "l", "l", "e", "h"])
    }
    
    // Soal 3
    func testBalancedBrackets() {
        XCTAssertEqual(balancedBrackets("{[()]}"), "YES")
        XCTAssertEqual(balancedBrackets("{[(])}"), "NO")
        XCTAssertEqual(balancedBrackets("{(([])[])[]}"), "YES")
    }
}

UnitTests.defaultTestSuite.run()
