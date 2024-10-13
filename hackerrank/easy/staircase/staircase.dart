import 'dart:io';

// Solution 1
// Time Complexity: O(n)
// Space Complexity: O(1)
void staircase(int n) {
  for (int index = 1; index <= n; index++) {
    stdout.write(" " * (n - index));
    stdout.write("#" * index);
    print("");
  }
}

// Solution 2
// Time Complexity: O(n2)
// Space Complexity: O(1)
void staircase2(int n) {
  for (int index = 1; index <= n; index++) {
    for (int i = 1; i <= (n - index); i++) {
      stdout.write(" ");
    }

    for (int i = 1; i <= index; i++) {
      stdout.write("#");
    }

    print("");
  }
}

void main() {
  int n = int.parse(stdin.readLineSync()!);
  staircase(n);
}
