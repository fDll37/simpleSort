import Foundation

//Test.run()

Sort.getRandomArray(with: .ten)
let arrayForSort = Sort.array
print("start Counting sort. Array count = \(arrayForSort.count)")
let start = Date()
Sort.countingSort()
let end = Date()

Sort.getStatistic()
print("time: \(end.timeIntervalSince(start))")
print("------------------------------------")
print(arrayForSort)
print(Sort.array)
