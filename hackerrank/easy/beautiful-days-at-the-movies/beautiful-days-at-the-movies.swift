// Time Complexity: O((j - i + 1) * log n)
// Space Complexity: O(1)
func beautifulDays(i: Int, j: Int, k: Int) -> Int {
  var beautifulDaysCount = 0
  
  for day in i...j {
    var number = day
    var reversed = 0
    
    while number != 0 {
        let digit = number % 10
        reversed = reversed * 10 + digit
        number /= 10
    }

    let difference = abs(day - reversed)
    
    if difference % k == 0 {
      beautifulDaysCount += 1
    }
  }
  
  return beautifulDaysCount
}