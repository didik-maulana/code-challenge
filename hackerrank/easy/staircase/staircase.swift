
// Solution 1
// Time Complexity: O(n2)
// Space Complexity: O(n)
func staircase(n: Int) {
    for index in 1...n {
        let spaces = String(repeating: " ", count: n-index)
        let hashes = String(repeating: "#", count: index)
        print(spaces + hashes)
    }
}

// Solution 2
// Time Complexity: O(n2)
// Space Complexity: O(1)
func staircase2(n: Int) {
    for index in 1...n {
        for _ in 1...(n-index) {
            print(" ", terminator: "")
        }
        for _ in 1...index {
            print("#", terminator: "")
        }
        print()
    }
}