/*
Given a string of only lowercase alphabet characters, find the 
character that occurs the highest number of times. If any characters 
tie, return them all in alphabetical order.
*/

function highestFreq (str) {
  // Write your code here, and
  // return your final answer.

  var counts = {}
  var highestCount = 0
  str.split('').forEach(function (char) {
    counts[char] || (counts[char] = 0)
    counts[char] += 1
    if (counts[char] > highestCount) highestCount = counts[char]
  })
  
  var highestChars = Object.keys(counts).filter(function (char) {
    return counts[char] == highestCount
  })
  
  highestChars.sort()
  return highestChars.join('')

}
