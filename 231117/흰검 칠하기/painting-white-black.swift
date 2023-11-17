enum Color {
    case white
    case black
    case gray
}

struct Tile {
    var white: Int
    var black: Int
    var color: Color?
    
    init(_ w: Int, _ b: Int) {
        self.white = w
        self.black = b
        self.color = nil
    }
}

let n = Int(readLine()!)!
var board = [Tile](repeating: Tile(0, 0), count: 200001)
var now = 100000

var whiteCount = 0
var blackCount = 0
var grayCount = 0

for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }
    let x = Int(raw[0])!


    if raw[1] == "R" {
        for i in now ..< now + x {
            guard board[i].color != .gray else { continue }
            
            if board[i].white >= 2 && board[i].black >= 1 { board[i].black += 1; board[i].color = .gray }
            else { board[i].black += 1; board[i].color = .black }
        }

        now += (x - 1)
    } else {
        for i in stride(from: now, to: now - x, by: -1) {
            guard board[i].color != .gray else { continue }
            
            if board[i].white >= 1 && board[i].black >= 2 { board[i].white += 1; board[i].color = .gray }
            else { board[i].white += 1; board[i].color = .white }
        }

        now -= (x - 1)
    }
}


for i in 0 ... 200000 {
    switch board[i].color {
    case .white: whiteCount += 1
    case .black: blackCount += 1
    case .gray: grayCount += 1
    default: break
    }
}

print(whiteCount, blackCount, grayCount)