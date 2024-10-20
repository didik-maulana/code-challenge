// Time Complexity: O(n)
// Space Complexity: O(1)
List<int> breakingRecords(List<int> scores) {
  int minRecord = 0;
  int maxRecord = 0;
  int lowest = scores[0];
  int highest = scores[0];

  for (int index = 0; index < scores.length; index++) {
    int score = scores[index];

    if (score < lowest) {
      minRecord++;
      lowest = score;
    } else if (score > highest) {
      maxRecord++;
      highest = score;
    }
  }

  return [maxRecord, minRecord];
}
