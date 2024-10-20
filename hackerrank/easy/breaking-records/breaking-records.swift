// Time Complexity: O(n)
// Space COmplexity: O(1)
func breakingRecords(scores: [Int]) -> [Int] {
    var minRecord = 0
    var maxRecord = 0
    
    var lowest = scores[0]
    var highest = scores[0]
    
    for score in scores {
      if score < lowest {
        minRecord += 1
        lowest = score
      } else if score > highest {
        maxRecord += 1
        highest = score
      }
    }
    
    return [maxRecord, minRecord]
}