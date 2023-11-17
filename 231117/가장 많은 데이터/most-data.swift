let n = Int(readLine()!)!
var dict = [String:Int]()
var result = 0

for _ in 0 ..< n {
    let key = readLine()!
    dict[key, default: 0] += 1
    result = max(dict[key, default: 0], result)
}

print(result)