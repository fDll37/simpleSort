import Foundation

//Test.run()

Sort.getRandomArray(with: .ten)
let arrayForSort = Sort.array
print("start Bucket sort. Array count = \(arrayForSort.count)")
let start = Date()
Sort.insertionSort()
let end = Date()

Sort.getStatistic()
print("time: \(end.timeIntervalSince(start))")
print("------------------------------------")
print(arrayForSort)
print(Sort.array)
