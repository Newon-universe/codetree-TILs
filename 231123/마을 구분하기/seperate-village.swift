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

func dfs(_ depth: Int, _ now: Coordinate) {
    
    for direct in directions {
        let next = Coordinate(now.y + direct.y, now.x + direct.x)

        guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
        guard board[next.y][next.x] == 1 else { continue }

        board[next.y][next.x] = 2
        dfs(depth + 1, next)
        temp += 1
    }
}

let n = Int(readLine()!)!
var board = [[Int]]()
var temp = 0
var result = [Int]()

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for i in 0 ..< n {
    for j in 0 ..< n {
        if board[i][j] == 1 {
            board[i][j] = 2
            temp = 1
            dfs(0, Coordinate(i, j))
            result.append(temp)
        }
    }
}

print(result.count)
result.sorted().forEach { print($0) }