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
        
        for index in 1...j {
            if more(array[index], array[indexMax]) {
                indexMax = index
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
    
}
