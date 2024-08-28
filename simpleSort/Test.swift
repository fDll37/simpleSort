import Foundation


class Test {
    
    enum File: String {
        case input = "in"
        case output = "out"
    }
    
    static private let fileManager = FileManager.default
    
    private init() {}
    
    static func run() {
//        print("==================RANDOM======================")
//        checkRandom()
//        print("==================DIGITS======================")
//        checkDigits()
//        print("==================SORTED======================")
//        checkSorted()
//        print("==================REVERS======================")
//        checkRevers()
    }
    
    static private func startBy(size: Int) {
        var arrayForSort: [Int] = []
        
        arrayForSort = Sort.array
        
        if size <= 10_000 {
//            print("start Bubble sort. Array count = \(size)")
//            var start = Date()
//            Sort.bubbleSort()
//            var end = Date()
//        
//            Sort.getStatistic()
//            print("time: \(end.timeIntervalSince(start))")
//            print("------------------------------------")
//            
//            Sort.array = arrayForSort
//            print("start Insertion sort. Array count = \(size)")
//            start = Date()
//            Sort.insertionSort()
//            end = Date()
//        
//            Sort.getStatistic()
//            print("time: \(end.timeIntervalSince(start))")
//            print("------------------------------------")
            
            
            Sort.array = arrayForSort
            print("start Selection sort. Array count = \(size)")
            let start = Date()
            Sort.selectionSort()
            let end = Date()
        
            Sort.getStatistic()
            print("time: \(end.timeIntervalSince(start))")
            print("------------------------------------")
        }

    
        
//        if size <= 100_000 {
//            Sort.array = arrayForSort
//            print("start Insertion SHIFT sort. Array count = \(size)")
//            var start = Date()
//            Sort.insertionShiftSort()
//            var end = Date()
//            
//            Sort.getStatistic()
//            print("time: \(end.timeIntervalSince(start))")
//            print("------------------------------------")
//            
//            Sort.array = arrayForSort
//            print("start Insertion BINARY sort. Array count = \(size)")
//            start = Date()
//            Sort.insertionBinaryShiftSort()
//            end = Date()
//        
//            Sort.getStatistic()
//            print("time: \(end.timeIntervalSince(start))")
//            print("------------------------------------")
//            
//        }
//    
//        Sort.array = arrayForSort
//        print("start Shell sort. Array count = \(size)")
//        let start = Date()
//        Sort.shellSort()
//        let end = Date()
//    
//        Sort.getStatistic()
//        print("time: \(end.timeIntervalSince(start))")
//        print("------------------------------------")
    }
    
    static private func checkRandom() {
        
        for index in 0...6 {
            let inputTestValue = getDataFrom(path: "test/random/test.\(index).\(File.input.rawValue)").split(separator: "\r\n")
            let countElement = Int(inputTestValue[0]) ?? 0
            let arrayInput = inputTestValue[1].split(separator: " ").compactMap {Int($0)}
            
            Sort.array = arrayInput
            startBy(size: countElement)
            
            let outputTestValue = getDataFrom(path: "test/random/test.\(index).\(File.output.rawValue)").replacingOccurrences(of: "\r\n", with: " ", options: .caseInsensitive).split(separator: " ").compactMap{Int($0)}
            
            if Sort.array == outputTestValue {
                print("Test №\(index) is GOOD\n\n\n")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    static private func checkDigits() {
        
        for index in 0...6 {
            let inputTestValue = getDataFrom(path: "test/digits/test.\(index).\(File.input.rawValue)").split(separator: "\r\n")
            let countElement = Int(inputTestValue[0]) ?? 0
            let arrayInput = inputTestValue[1].split(separator: " ").compactMap {Int($0)}
            
            Sort.array = arrayInput
            startBy(size: countElement)
            
            let outputTestValue = getDataFrom(path: "test/digits/test.\(index).\(File.output.rawValue)").replacingOccurrences(of: "\r\n", with: " ", options: .caseInsensitive).split(separator: " ").compactMap{Int($0)}
            
            if Sort.array == outputTestValue {
                print("Test №\(index) is GOOD\n\n\n")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    static private func checkSorted() {
        
        for index in 0...6 {
            let inputTestValue = getDataFrom(path: "test/sorted/test.\(index).\(File.input.rawValue)").split(separator: "\r\n")
            let countElement = Int(inputTestValue[0]) ?? 0
            let arrayInput = inputTestValue[1].split(separator: " ").compactMap {Int($0)}
            
            Sort.array = arrayInput
            startBy(size: countElement)
            
            let outputTestValue = getDataFrom(path: "test/sorted/test.\(index).\(File.output.rawValue)").replacingOccurrences(of: "\r\n", with: " ", options: .caseInsensitive).split(separator: " ").compactMap{Int($0)}
            
            if Sort.array == outputTestValue {
                print("Test №\(index) is GOOD\n\n\n")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
    
    static private func checkRevers() {
        
        for index in 1...6 {
            let inputTestValue = getDataFrom(path: "test/revers/test.\(index).\(File.input.rawValue)").split(separator: "\r\n")
            let countElement = Int(inputTestValue[0]) ?? 0
            let arrayInput = inputTestValue[1].split(separator: " ").compactMap {Int($0)}
            
            Sort.array = arrayInput
            startBy(size: countElement)
            
            let outputTestValue = getDataFrom(path: "test/revers/test.\(index).\(File.output.rawValue)").replacingOccurrences(of: "\r\n", with: " ", options: .caseInsensitive).split(separator: " ").compactMap{Int($0)}
            
            if Sort.array == outputTestValue {
                print("Test №\(index) is GOOD\n\n\n")
            } else {
                print("Test \(index) is failed")
                break
            }
        }
    }
        
    static private func getDataFrom(path: String) -> String {
        
        if fileManager.fileExists(atPath: path) {
            do {
                let fileContents = try String(contentsOfFile: path, encoding: .utf8)
                return fileContents
            } catch {
                print("Error reading file: \(error.localizedDescription)")
                return "-2"
            }
        } else {
            print("File does not exist")
            return "-1"
        }
    }
}






