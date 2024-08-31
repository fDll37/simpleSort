import Foundation


extension Sort {
    
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
