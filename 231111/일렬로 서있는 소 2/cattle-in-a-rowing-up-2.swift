let n = Int(readLine()!)!
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = 0

for i in 0 ..< array.count - 2 {
    for j in i + 1 ..< array.count - 1 {
        for k in j + 1 ..< array.count {
            if array[i] < array[j] && array[j] < array[k] {
                result += 1
            }
        }
    }
}

print(result)