let n = Int(readLine()!)!
var dict = [Int:Int]()
var result = 0

for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! }

    if raw[1] < dict[raw[0], default: 100000] {
        dict[raw[0]] = raw[1]
    }
}

dict.values.forEach { result += $0 }
print(result)