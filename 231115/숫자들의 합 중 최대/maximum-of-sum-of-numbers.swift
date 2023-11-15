let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (X, Y) = (raw[0], raw[1])
var result = 0

for element in X ... Y {
    let value = Array(String(element)).map { Int(String($0))! }.reduce(0, +)
    result = max(result, value)
}

print(result)