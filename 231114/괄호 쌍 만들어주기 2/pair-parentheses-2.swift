let raw = Array(readLine()!).map { String($0) }
let n = raw.count
var result = 0

for i in 0 ..< n - 3 {
    guard raw[i] == "(" && raw[i + 1] == "(" else { continue }

    for j in i + 2 ..< n - 1 {
        if raw[j] == ")" && raw[j + 1] == ")" { result += 1 }
    }
}

print(result)