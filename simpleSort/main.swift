import Foundation

//Test.run()

Sort.getRandomArray(with: .ten)

print(Sort.array)
print("start Quick sort. Array count = \(Sort.array.count)")
let start = Date()
Sort.quickSort()
let end = Date()


print(Sort.array)
Sort.getStatistic()
print("time: \(end.timeIntervalSince(start))")
