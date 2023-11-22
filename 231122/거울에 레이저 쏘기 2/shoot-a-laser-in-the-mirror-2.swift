enum Direction {
    case down
    case up
    case left
    case right
}

struct Coordinate {
    var y: Int
    var x: Int
    var direct: Direction
    init(_ y: Int, _ x: Int, _ direct: Direction) {
        self.y = y
        self.x = x
        self.direct = direct
    }
}

func find(_ now: Coordinate, _ count: Int) {
    var next = now

    switch now.direct {
    case .up:
        if board[now.y][now.x] == "\\" {
            next.x += 1
            next.direct = .left
        } else {
            next.x -= 1
            next.direct = .right
        }
    case .down:
        if board[now.y][now.x] == "\\" {
            next.x -= 1
            next.direct = .right
        } else {
            next.x += 1
            next.direct = .left
        }
    case .left:
        if board[now.y][now.x] == "\\" {
            next.y += 1
            next.direct = .up
        } else {
            next.y -= 1
            next.direct = .down
        }
    case .right:
        if board[now.y][now.x] == "\\" {
            next.y -= 1
            next.direct = .down
        } else {
            next.y += 1
            next.direct = .up
        }
    }

    guard 0 ..< n ~= next.x && 0 ..< n ~= next.y else { print(count); return }
    find(next, count + 1)
}

let n = Int(readLine()!)!
var board = [[String]]()

for _ in 0 ..< n {
    board.append(Array(readLine()!).map { String($0) })
}

let start = Int(readLine()!)! - 1
var i = 0
var j = 0



switch start {
case start where start / n == 0:
    i = 0
    j = start % n
    find(Coordinate(i, j, .up), 1)
case start where start / n == 1: 
    i = start % n
    j = n - 1
    find(Coordinate(i, j, .right), 1)
case start where start / n == 2: 
    i = n - 1
    j = n - (start % n) - 1
    find(Coordinate(i, j, .down), 1)
case start where start / n == 3: 
    i = n - (start % n) - 1
    j = 0
    find(Coordinate(i, j, .left), 1)
default: break
}