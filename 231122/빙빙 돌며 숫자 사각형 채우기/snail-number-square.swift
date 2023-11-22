struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y 
        self.x = x
    }
}

let directions = [
    Coordinate(0, 1),
    Coordinate(1, 0),
    Coordinate(0, -1),
    Coordinate(-1, 0)
]

func find(_ depth: Int, _ now: Coordinate, _ check: Int) {
    guard check < 4 else { return }
    let next = Coordinate(now.y + directions[dIndex].y, now.x + directions[dIndex].x)

    guard 0 ..< n ~= next.y && 0 ..< m ~= next.x else { dIndex += 1; dIndex %= 4; find(depth, now, check + 1); return }
    guard board[next.y][next.x] == 0 else { dIndex += 1; dIndex %= 4; find(depth, now, check + 1); return }

    board[next.y][next.x] = depth
    find(depth + 1, next, 0)
}

var dIndex = 0
let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (source[0], source[1])

var board = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)

find(1, Coordinate(0, -1), 0)

board.forEach {
    $0.forEach { print($0, terminator: " ") }
    print()
}