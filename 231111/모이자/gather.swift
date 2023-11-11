let n = Int(readLine()!)!
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = Int.max

for i in 0 ..< array.count {
    var temp = 0
    for j in 0 ..< array.count {
        if i != j {
            temp += array[j] * (abs(i - j))
        }
    }
    result = min(result, temp)
}

print(result)