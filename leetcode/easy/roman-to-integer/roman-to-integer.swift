// Solution 1
// Time Complexity: O(n)
// Space Complexity: O(1)
// Solution loop from right-to-left (reversed)
func romanToInt(_ s: String) -> Int {
    var result = 0
    var previousValue = 0

    let romans: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]

    for char in s.reversed() {
        let currentValue = romans[char] ?? 0

        if currentValue < previousValue {
            result -= currentValue
        } else {
            result += currentValue
        }

        previousValue = currentValue
    }

    return result
}

// Solution 2
// Time Complexity: O(n)
// Space Complexity: O(1)
// Solution loop from left-to-right
func romanToInt2(_ s: String) -> Int {
    var result = 0
    var previousValue = 0

    let romans: [Character: Int] = [
        "I": 1,
        "V": 5,
        "X": 10,
        "L": 50,
        "C": 100,
        "D": 500,
        "M": 1000
    ]

    for char in s {
        let currentValue = romans[char] ?? 0

        if previousValue < currentValue {
            result -= 2 * previousValue
        }

        result += currentValue
        previousValue = currentValue
    }

    return result
}