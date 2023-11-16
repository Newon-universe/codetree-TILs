func makeB(_ raw: Int, _ radix: Int) -> String {
    var raw = raw
    var result = ""

    while raw > 0 {
        result = String(raw % radix) + result
        raw /= radix
    }

    return result
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, B) = (raw[0], raw[1])

print(makeB(N, B))