let n = Int(readLine()!)!
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = 0

for i in 0 ..< n {
    for j in i + 2 ..< n + 2 {
        guard j < n else { break }
        result = max(array[i] + array[j], result)
    }
}

print(result)