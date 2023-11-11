let raw = Array(readLine()!)
var result = 0

for i in 0 ..< raw.count {
    for j in i ..< raw.count {
        if i == j { continue }
        if raw[i] == "(" && raw[j] == ")" { result += 1 }
    }
}

print(result)