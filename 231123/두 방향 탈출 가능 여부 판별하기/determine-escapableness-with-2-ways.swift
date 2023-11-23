struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let directions = [
    Coordinate(1, 0),
    Coordinate(0, 1)
]

func dfs(_ now: Coordinate) {
    if now.y == n - 1 && now.x == m - 1 {
        result = 1
        return
    }

    for direct in directions {
        let next = Coordinate(now.y + direct.y, now.x + direct.x)
        
        guard 0 ..< n ~= next.y && 0 ..< m ~= next.x else { continue }
        guard board[next.y][next.x] == 1 else { continue }
        dfs(next)
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
var result = 0

var board = [[Int]]()
for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

dfs(Coordinate(0 ,0))
print(result)