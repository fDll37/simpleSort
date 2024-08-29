import Foundation

extension Sort {
    
    static func heapSort() {
        prepareForStart()
        
        var h = array.count / 2 - 1
        while h >= 0 {
            heapify(root: h, size: array.count)
            h -= 1
        }
        
        var j = array.count - 1
        while j > 0 {
            swap(0, j)
            heapify(root: 0, size: j)
            j -= 1
        }
        
    }
    
    static private func heapify(root: Int, size: Int) {
        var p = root
        let left = 2 * p + 1
        let right = left + 1
        
        if left < size && more(array[left], array[p]) {
            p = left
        }
        if right < size && more(array[right], array[p]) {
            p = right
        }
        if p == root {
            return
        }
        swap(root, p)
        heapify(root: p, size: size)
    }
    
    static func selectionSort() {
        prepareForStart()
        var j = array.count - 1
        
        while j > 0 {
            swap(findMax(j: j), j)
            j -= 1
        }
    }
}
