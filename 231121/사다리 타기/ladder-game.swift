struct Connection {
    var a: Int
    var b: Int
    init(_ a: Int, _ b: Int) {
        self.a = a
        self.b = b
    }
}

struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

func find(_ depth: Int, _ now: Int) -> Int {
    if depth == m {
        return now
    }

    if let connection = board[depth][now] {
        let tempNow = connection.a == now ? connection.b : connection.a
        print(depth + 1, tempNow, "Move \(now) -> \(tempNow)")
        return find(depth + 1, tempNow)
    } else {
        print(depth + 1, now, "No Move")
        return find(depth + 1, now)
    }
}


let raw = readLine()!.split { $0 == " " }.map { Int($0)! }

let (n, m) = (raw[0], raw[1])
var board = [[Connection?]](repeating: [Connection?](repeating: nil, count: n), count: m)
var ignoredLine = [Coordinate]()
var result = [Int](repeating: 0, count: n)

for _ in 0 ..< m {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    let y = raw[1]
    let x = raw[0]
    board[y][x] = Connection(x, x + 1)
    board[y][x + 1] = Connection(x + 1, x)
}

(0 ..< n).forEach {
    print($0)
    print(find(0, $0))
    print()
}