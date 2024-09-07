import Foundation

extension Sort {
    
    static func getRandomArray(with size: SizeArray) {
        array = []
        for _ in 0..<size.rawValue {
            array.append(Int.random(in: 0...size.rawValue))
        }
    }
    
    static func getStatistic() {
        print("N = \(array.count), Перестановок = \(cmp), Присвоений = \(asg)")
    }
    
    static func findMax(j: Int) -> Int {
        var indexMax = 0
        
        if array.count > 0 {
            for index in 1...j {
                if more(array[index], array[indexMax]) {
                    indexMax = index
                }
            }
        }
        return indexMax
    }
    
    static func binarySearch(key: Int, low: Int, high: Int) -> Int {
        if high <= low {
            if moreq(key, array[low]) {
                return low + 1
            }
            return low
        }
        
        let middle = (low + high) / 2
        if more(key, array[middle]) {
            return binarySearch(key: key, low: middle + 1, high: high)
        } else {
            return binarySearch(key: key, low: low, high: middle - 1)
        }
        
    }
    
    static func prepareForStart() {
        asg = 0
        cmp = 0
    }
    
    static func swap(_ index: Int, _ indexTwo: Int) {
        asg += 3
        let temp = array[index]
        array[index] = array[indexTwo]
        array[indexTwo] = temp
    }
    
    static func more(_ value: Int, _ valueTwo: Int) -> Bool {
        cmp += 1
        return value > valueTwo
    }
    
    static func moreq(_ value: Int, _ valueTwo: Int) -> Bool {
        cmp += 1
        return value >= valueTwo
    }
    
    static func split(_ left: Int, _ right: Int) -> Int {
        let point = array[right]
        var middle = left - 1
        
        for index in left...right {
            if moreq(point, array[index]) {
                middle += 1
                swap(middle, index)
            }
        }
        
        return middle
    }
 
    static func merge(left: Int, middle: Int, right: Int) {
        var tempArray: [Int] = Array(repeating: 0, count: right - left + 1)
        var indexFirst = left
        var indexSecond = middle + 1
        var indexMiddle = 0
        asg += 3
        
        while moreq(middle, indexFirst) && moreq(right, indexSecond) {
            if more(array[indexFirst], array[indexSecond]) {
                tempArray[indexMiddle] = array[indexSecond]
                indexMiddle += 1
                indexSecond += 1
                asg += 1
            } else {
                tempArray[indexMiddle] = array[indexFirst]
                indexMiddle += 1
                indexFirst += 1
                asg += 1
            }
        }
        
        while moreq(middle, indexFirst) {
            tempArray[indexMiddle] = array[indexFirst]
            indexMiddle += 1
            indexFirst += 1
            asg += 1
        }
        
        while moreq(right, indexSecond) {
            tempArray[indexMiddle] = array[indexSecond]
            indexMiddle += 1
            indexSecond += 1
            asg += 1
        }
        
        for index in left...right {
            array[index] = tempArray[index - left]
            asg += 1
        }
    }
    
}
