enum Tile {
    case white
    case black
}

let n = Int(readLine()!)!
var now = 100000
var board = [Tile?](repeating: nil, count: 200001)
var whiteCount = 0
var blackCount = 0

for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }
    let x = Int(raw[0])!

    if raw[1] == "R" {
        for i in now ..< now + x {
            board[i] = .black
        }
        now += x - 1
    } else {
        for i in stride(from: now, to: now - x, by: -1) {
            board[i] = .white
        }
        now -= x - 1
    }
}

for i in 0 ... 200000 {
    if board[i] == .white { whiteCount += 1 }
    else if board[i] == .black { blackCount += 1 }
}

print(whiteCount, blackCount)