// Solution 1
// Time Complexity: O(n)
// Space Complexity: O(1)
// Solution loop from right-to-left (reversed)
int romanToInt(String s) {
  int result = 0;
  int previousValue = 0;

  Map<String, int> romans = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000};

  for (int i = s.length - 1; i >= 0; i--) {
    int currentValue = romans[s[i]] ?? 0;

    if (currentValue < previousValue) {
      result -= currentValue;
    } else {
      result += currentValue;
    }

    previousValue = currentValue;
  }

  return result;
}

// Solution 2
// Time Complexity: O(n)
// Space Complexity: O(1)
// Solution loop from left-to-right
int romanToInt2(String s) {
  int result = 0;
  int previousValue = 0;

  Map<String, int> romans = {'I': 1, 'V': 5, 'X': 10, 'L': 50, 'C': 100, 'D': 500, 'M': 1000};

  for (int i = 0; i < s.length; i++) {
    int currentValue = romans[s[i]] ?? 0;

    if (currentValue > previousValue) {
      result -= 2 * previousValue;
    }

    result += currentValue;
    previousValue = currentValue;
  }

  return result;
}
