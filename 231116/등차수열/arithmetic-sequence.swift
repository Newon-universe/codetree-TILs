import Foundation

let n = Int(readLine()!)!

let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = 0

for i in 0 ..< n - 1 {
    for j in i + 1 ..< n {
        let mid = (Double(array[i]) + Double(array[j])) / Double(2)
        if mid.truncatingRemainder(dividingBy: 1.0) == 0 { result += 1 }
    }
}

print(result)