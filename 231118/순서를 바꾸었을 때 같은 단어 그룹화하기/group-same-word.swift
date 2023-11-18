let n = Int(readLine()!)!
var dict = [String:Int]()

for _ in 0 ..< n {
    let raw = Array(readLine()!).map { String($0) }.sorted().reduce("", +)
    dict[raw, default: 0] += 1
}

print(dict.values.max()!)