import Foundation

let n = Int(readLine()!)!

let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = [Int: Int]()

for i in 0 ..< n - 1 {
    for j in i + 1 ..< n {
        if (array[i] + array[j]) % 2 == 0 {
            let mid = (array[i] + array[j]) / 2
            result[mid, default: 0] += 1
        }
    }
}

print(result.values.max() ?? 0)