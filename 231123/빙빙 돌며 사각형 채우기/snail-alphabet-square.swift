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
    Coordinate(-1, 0),
    Coordinate(0, -1),
    Coordinate(1, 0)
]

func find(_ depth: Int, _ now: Coordinate, _ dIndex: Int, _ check: Int) {
    guard check < 4 else { return }

    let next = Coordinate(now.y + directions[dIndex].y, now.x + directions[dIndex].x)
    guard 0 ..< n ~= next.y && 0 ..< m ~= next.x else { find(depth, now, (dIndex + 1) % 4, check + 1); return }
    guard board[next.y][next.x] == "" else { find(depth, now, (dIndex + 1) % 4, check + 1); return }

    board[next.y][next.x] = String(UnicodeScalar(65 + (depth % 26))!)
    find(depth + 1, next, dIndex, 0)
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
var board = [[String]](repeating: [String](repeating: "", count: m), count: n)
var result = ""
find(0, Coordinate(0, -1), 0, 0)


for plate in board {
    plate.forEach { result += "\($0) " }
    result += "\n"
}

print(result)