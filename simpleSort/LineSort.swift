import Foundation

extension Sort {
    
    static func bucketSort() {
        var bucket: [ListBucket] = Array(repeating: ListBucket(value: -1, next: nil), count: array.count)
        let max = findMax(j: array.count - 1)
        asg += UInt64(1 + array.count)
        
        for element in array {
            let numberBucket: Int = element * (array.count - 1) / array[max]
            bucket[numberBucket] = ListBucket(value: element, next: bucket[numberBucket])
            
            var item = bucket[numberBucket]
            asg += 3
            
            while item.next != nil {
                guard let next = item.next, next.value != -1 else { break }
                asg += 1
                
                if item.value < next.value && next.value != -1 {
                    break
                }
                let x = item.value
                item.value = next.value
                next.value = x
                item = next
                asg += 4
            }
        }
        
        var j = 0
        for bucketElement in bucket {
            var element = bucketElement
            asg += 1
            while true {
                if element.value != -1 {
                    array[j] = element.value
                    asg += 1
                    if let next = element.next {
                        element = next
                        j += 1
                        asg += 2
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
        }
    }
    
    static func countingSort() {
        let maxValue = array.max()!
        
        var countArray = Array(repeating: 0, count: maxValue + 1)
        
        for num in array {
            countArray[num] += 1
        }
        
        var sortedArray: [Int] = []
        
        for i in 0..<countArray.count {
            for _ in 0..<countArray[i] {
                sortedArray.append(i)
            }
        }
        array = sortedArray
    }
    
}

private extension Sort {
    
    class ListBucket {
        var value: Int
        var next: ListBucket?
        
        init(value: Int, next: ListBucket? = nil) {
            self.value = value
            self.next = next
        }
    }
}
