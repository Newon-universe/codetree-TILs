import Foundation

let n = Int(readLine()!)!

let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = [Double: Int]()

for i in 0 ..< n - 1 {
    for j in i + 1 ..< n {
        let mid = (Double(array[i]) + Double(array[j])) / Double(2)
        if abs(Double(array[i]) - mid) == abs(Double(array[j]) - mid) { result[mid, default:0] += 1 }
    }
}

print(result.values.max() ?? 0)