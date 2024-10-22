// Time Complexity: O((j - i + 1) * log n)
// Space Complexity: O(1)
int beautifulDays(int i, int j, int k) {
  int beautifulDaysCount = 0;

  for (int day = i; day <= j; day++) {
    int number = day;
    int reversed = 0;

    while (number != 0) {
      int digit = number % 10;
      reversed = reversed * 10 + digit;
      number ~/= 10;
    }

    int difference = (day - reversed).abs();

    if (difference % k == 0) {
      beautifulDaysCount++;
    }
  }

  return beautifulDaysCount;
}
