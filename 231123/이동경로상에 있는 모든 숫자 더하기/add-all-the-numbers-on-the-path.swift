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
    Coordinate(0, 1),
    Coordinate(1, 0),
    Coordinate(0, -1)
]


let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, t) = (source[0], source[1])
let oper = Array(readLine()!).map { String($0) }
var dIndex = 0

var board = [[Int]]()
for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}
var start = Coordinate(n / 2, n / 2)
var result = board[start.y][start.x]

oper.forEach {
    switch $0 {
    case "L": if dIndex == 0 { dIndex = 3 } else { dIndex -= 1 }
    case "R": if dIndex == 3 { dIndex = 0 } else { dIndex += 1 }
    case "F": 
        guard 0 ..< n ~= start.y + directions[dIndex].y && 0 ..< n ~= start.x + directions[dIndex].x else { break }
        start.y += directions[dIndex].y; start.x += directions[dIndex].x
        result += board[start.y][start.x]
    default: break
    }
}

print(result)