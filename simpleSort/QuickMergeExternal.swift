import Foundation


extension Sort {
    
    static func mergeSort() {
        prepareForStart()
        mSort(left: 0, right: array.count - 1)
    }
    
    static private func mSort(left: Int, right: Int) {
        
        if left >= right {
            return
        }
        let middle = (left + right) / 2
        mSort(left: left, right: middle)
        mSort(left: middle + 1, right: right)
        merge(left: left, middle: middle, right: right)
    }
    
    static func quickSort() {
        prepareForStart()
        qsort(left: 0, right: array.count - 1)
        
    }
    
    static private func qsort(left: Int, right: Int) {
        if left >= right {
            return
        }
        
        let middle = split(left, right)
        qsort(left: left, right: middle - 1)
        qsort(left: middle + 1, right: right)
    }
    

}
