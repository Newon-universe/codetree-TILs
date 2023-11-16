func makeBinary(_ raw: Int) -> String {
    var raw = raw
    var result = ""
    
    while raw > 0 {
        result = String(raw % 2) + result
        raw /= 2
    }

    return result
}

let n = Array(readLine()!).map { Int(String($0))! }
var result = 0
for element in n {
    result = result * 2 + element
}

print(makeBinary(result * 17))