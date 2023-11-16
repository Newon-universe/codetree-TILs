func check(_ index: Int) -> Bool {
    var d1 = 1001
    var d2 = 1001

    for i in 0 ... 1000 {
        if board[i] == "S" { d1 = min(d1, abs(index - i)) }
        else if board[i] == "N" { d2 = min(d2, abs(index - i)) }
    }

    return d1 <= d2
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (t, a, b) = (raw[0], raw[1], raw[2])
var board = [String](repeating: "", count: 1001)
var result = 0

for _ in 0 ..< t {
    let location = readLine()!.split { $0 == " " }
    board[Int(location[1])!] = String(location[0])
}

for i in a ... b {
    if check(i) { result += 1 }
}

print(result)