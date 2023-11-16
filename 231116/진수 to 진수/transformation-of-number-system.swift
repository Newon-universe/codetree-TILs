func makePow(_ raw: Int, _ radix: Int) -> Int {
    var result = 1
    for _ in 0 ..< raw { result *= radix }
    return result
}

func makeB(_ raw: Int) -> String {
    var raw = raw
    var result = ""

    while raw > 0 {
        result = String(raw % b) + result
        raw /= b
    }

    return result
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (a, b) = (raw[0], raw[1])
let n = Array(readLine()!).map { Int(String($0))! }
var result = 0

for i in 0 ..< n.count { 
    result += makePow(n.count - i - 1, a) * n[i]
}

print(makeB(result))