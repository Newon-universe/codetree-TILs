struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let directions = [
    Coordinate(0, -1),
    Coordinate(-1, 0),
    Coordinate(0, 1),
    Coordinate(1, 0)
]

func solve(_ depth: Int, _ now: Coordinate, _ dIndex: Int, _ check: Int) {
    if depth == 0 || check > 4 {
        return
    }

    let next = Coordinate(now.y + directions[dIndex].y, now.x + directions[dIndex].x)
    guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { solve(depth, now, (dIndex + 1) % 4, check + 1); return }
    guard board[next.y][next.x] == 0 else { solve(depth, now, (dIndex + 1) % 4, check + 1); return }

    board[next.y][next.x] = depth
    solve(depth - 1, next, dIndex, 0)
}

let n = Int(readLine()!)!
var board = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
let start = Coordinate(n - 1, n)
var result = ""

solve(n * n, start, 0, 0)
for plate in board {
    plate.forEach { result += "\($0) " }
    result += "\n"
}

print(result)