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
    Coordinate(0, 1),

    Coordinate(-1, -1),
    Coordinate(1, -1),
    Coordinate(-1, 1),
    Coordinate(1, 1)
]

func find(_ depth: Int, _ now: Coordinate, _ direct: Coordinate) {
    if depth == 2 {
        result += 1
        return
    }

    let next = Coordinate(now.y + direct.y, now.x + direct.x)
    guard 0 ..< N ~= next.y && 0 ..< M ~= next.x else { return }
    guard board[next.y][next.x] == "E" else { return }
    guard !visited[next.y][next.x] else { return }
    find(depth + 1, next, direct)
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (raw[0], raw[1])
var result = 0
var board = [[String]]()
var visited = [[Bool]](repeating: [Bool](repeating: false, count: M), count: N)

for _ in 0 ..< N {
    board.append(Array(readLine()!).map { String($0) })
}

for i in 0 ..< N {
    for j in 0 ..< M {
        if board[i][j] == "L" { 

            for direct in directions {
                find(0, Coordinate(i, j), direct)
            }

        }
    }
}

print(result)