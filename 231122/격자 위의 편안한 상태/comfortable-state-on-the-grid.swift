struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let directions = [
    Coordinate(-1, 0),
    Coordinate(1, 0),
    Coordinate(0, -1),
    Coordinate(0, 1)
]

func check(_ now: Coordinate) -> Int {
    var temp = 0
    for direct in directions {
        let next = Coordinate(now.y + direct.y, now.x + direct.x)

        guard 0 ..< n ~= next.x && 0 ..< n ~= next.y else { continue }
        if board[next.y][next.x] == 1 { temp += 1 }
    }
    
    return temp >= 3 ? 1 : 0
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (source[0], source[1])
var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
var result = ""

for _ in 0 ..< m {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    let y = raw[0]
    let x = raw[1]
    board[y][x] = 1
    
    result += "\(check(Coordinate(y, x)))\n"
}

print(result)