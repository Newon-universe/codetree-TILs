func explode(_ depth: Int, _ count: Int, _ board: [[Int]]) {
    if depth == bombLocation.count {
        result = max(result, count)        
        return
    }

    let now = bombLocation[depth]

    for bomb in bombs {
        var tempBoard = board
        var tempCount = count

        for bombCord in bomb {
            let next = Coordinate(bombCord.y + now.y, bombCord.x + now.x)

            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard tempBoard[next.y][next.x] != -1 else { continue }

            tempCount += 1
            tempBoard[next.y][next.x] = -1
        }

        explode(depth + 1, tempCount, tempBoard)
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

let bombs = [
    [Coordinate(-2, 0), Coordinate(-1, 0), Coordinate(0, 0), Coordinate(1, 0), Coordinate(2, 0)],
    [Coordinate(-1, 0), Coordinate(1, 0), Coordinate(0, 0), Coordinate(0, -1), Coordinate(0, 1)],
    [Coordinate(-1, -1), Coordinate(-1, 1), Coordinate(0, 0), Coordinate(1, -1), Coordinate(1, 1)]
]

let n = Int(readLine()!)!
var board = [[Int]]()
var bombLocation = [Coordinate]()
var result = 0

for i in 0 ..< n {
    board.append(
        readLine()!.split { $0 == " " }.enumerated().map { j, raw in 
            let value = Int(raw)!
            if value == 1 { bombLocation.append(Coordinate(i, j)) }
            return Int(raw)! 
        }
    )
}

explode(0, 0, board)
print(result)