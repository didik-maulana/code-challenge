// Time Complexity: O(n)
// Space Complexity: O(1)
String angryProfessor(int k, List<int> a) {
  int onTimeStudents = 0;

  for (int arrival in a) {
    if (arrival <= 0) {
      onTimeStudents += 1;
    }

    if (onTimeStudents >= k) {
      return "NO";
    }
  }

  return "YES";
}
