let n = Array(readLine()!).map { Int(String($0))! }
var result = 0

for element in n {
    result = result * 2 + element
}

print(result)