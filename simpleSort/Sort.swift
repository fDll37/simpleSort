import Foundation

enum SizeArray: Int, CaseIterable {
    case ten = 10
    case oneHundred = 100
    case oneThousand = 1000
    case tenThousand = 10_000
    case hundredThousand = 100_000
    case million = 1_000_000
}

class Sort {
    
    static var array: [Int] = []
    static var asg: UInt64 = 0 // кол-во присвоений
    static var cmp: UInt64 = 0 // кол-во сравнений
    
    
    static func bubbleSort() {
        prepareForStart()
        let count = array.count
        
        for i in stride(from: count - 1, to: 0, by: -1) {
            let currentAsg = asg
            for j in 0..<i {
                if more(array[j], array[j + 1]) {
                    swap(j, j + 1)
                }
            }
            if asg == currentAsg {
                break
            }
        }
    }

    static func insertionSort() {
        prepareForStart()
        
        for i in 1..<array.count {
            var j = i - 1
            while j >= 0 && more(array[j], array[j + 1]) {
                swap(j, j + 1)
                j -= 1
            }
            
        }
    }
    
    static func insertionShiftSort() {
        prepareForStart()
        
        
        for i in 1..<array.count {
            let temp = array[i]
            asg += 1
            
            var j = i - 1
            while j >= 0 && more(array[j], temp) {
                array[j + 1] = array[j]
                asg += 1
                j -= 1
            }
            array[j + 1] = temp
            asg += 1
        }
    }
    
    static func insertionBinaryShiftSort() {
        prepareForStart()
        
        
        for i in 1..<array.count {
            let temp = array[i]
            let p = binarySearch(key: temp, low: 0, high: i - 1)
            asg += 1
            
            var j = i - 1
            while j >= p {
                array[j + 1] = array[j]
                j -= 1
            }
            asg += UInt64(i - p)
            array[j + 1] = temp
            asg += 1
        }
    }

    static func shellSort() {
        prepareForStart()
        
        var gap = array.count / 2
        
        while gap > 0 {
            for j in gap..<array.count {
                var i = j
                while i >= gap && more(array[i - gap], array[i]) {
                    swap(i - gap, i)
                    i -= gap
                }
            }
            
            gap /= 2
        }
    }

}
