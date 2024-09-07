import Foundation


extension Sort {
    
    
    
    static func bucketSort() {
        var bucket: [ListBucket] = Array(repeating: ListBucket(value: -1, next: nil), count: array.count)
        let max = findMax(j: array.count)
        
        for element in array {
            let numberBucket: Int = element * array.count / max
            bucket[numberBucket] = ListBucket(value: element, next: bucket[numberBucket])
            
            var item = bucket[numberBucket]
            
            while item.next != nil {
                guard let next = item.next else { break }
                
                if item.value < next.value {
                    break
                }
                let x = item.value
                item.value = next.value
                next.value = x
                item = next
            }
        }
        
        var j = 0
        for bucketElement in bucket {
            repeat {
                if bucketElement.value != -1 {
                    array[j] = bucketElement.value
                    j += 1
                }
            }
            while bucketElement.next != nil
        }
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
