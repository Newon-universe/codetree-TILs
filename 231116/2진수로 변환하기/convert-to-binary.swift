func makeBinary(_ raw: Int) {
    guard raw > 0 else { print(0); return }
    var raw = raw
    var result = ""

    while raw > 0 {
        result = String(raw % 2) + result
        raw /= 2
    }

    print(result)
}

let n = Int(readLine()!)!
makeBinary(n)