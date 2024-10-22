// Time Complexity: O(n)
// Space Complexity: O(1)
func angryProfessor(k: Int, a: [Int]) -> String {
    var onTimeStudents = 0

    for arrival in a {
        if arrival <= 0 {
            onTimeStudents += 1
        }

        if onTimeStudents >= k {
            return "NO"
        }
    }

    return "YES"
}