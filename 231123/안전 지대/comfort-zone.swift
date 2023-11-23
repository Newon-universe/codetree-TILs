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

func dfs(_ k: Int, _ now: Coordinate) {
    for direct in directions {
        let next = Coordinate(now.y + direct.y, now.x + direct.x)

        guard 0 ..< n ~= next.y && 0 ..< m ~= next.x else { continue }
        guard board[next.y][next.x] > k else { continue }
        guard !visited[next.y][next.x] else { continue }
        
        visited[next.y][next.x] = true
        dfs(k, next)
    }   
}



let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])

var board = [[Int]]()
var visited = [[Bool]]()
var count = -1
var result = -1

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for k in 1 ... 100 {
    var temp = 0
    visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    
    for i in 0 ..< n {
        for j in 0 ..< m {
            if !visited[i][j] && board[i][j] > k {
                temp += 1
                dfs(k, Coordinate(i, j))
            }
        }
    }

    if temp > count {
        count = temp
        result = k
    }
}

print(result, count)