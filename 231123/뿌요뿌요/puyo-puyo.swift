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

func find(_ now: Coordinate, _ target: Int) {
    for direct in directions {
        let next = Coordinate(now.y + direct.y, now.x + direct.x)

        guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
        guard board[next.y][next.x] > 0 else { continue }
        guard board[next.y][next.x] == target else { continue }

        temp += 1
        board[next.y][next.x] = 0
        find(next, target)
    }
}

let n = Int(readLine()!)!
var board = [[Int]]()
var temp = 0
var bombBlock = 0
var bombCount = 0

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for i in 0 ..< n {
    for j in 0 ..< n {
        if board[i][j] > 0 {
            temp = 0
            find(Coordinate(i, j), board[i][j])

            if temp > 3 {
                bombBlock += 1
            }
            bombCount = max(temp, bombCount)
        }
    }
}

print(bombBlock, bombCount)