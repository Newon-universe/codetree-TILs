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

func find(_ now: Coordinate) -> Bool {
    var count = 0
    for direct in directions {
        let next = Coordinate(now.y + direct.y, now.x + direct.x)
        guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }

        if board[next.y][next.x] == 1 { count += 1 }
    }

    return count > 2
}

let n = Int(readLine()!)!
var board = [[Int]]()
var result = 0

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for i in 0 ..< n {
    for j in 0 ..< n {
        if find(Coordinate(i, j)) { result += 1 }
    }
}

print(result)