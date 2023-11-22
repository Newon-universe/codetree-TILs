struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

func combi(_ depth: Int, _ trace: [Int], _ index: Int) {
    if depth == n {
        let a = Coordinate(trace[0] / n, trace[0] % n)
        let b = Coordinate(trace[1] / n, trace[1] % n)
        let c = Coordinate(trace[2] / n, trace[2] % n)

        guard a.x != b.x && a.x != c.x && b.x != c.x && a.y != b.y && a.y != c.y && b.y != c.y else { return }
        
        let value = board[a.y][a.x] + board[b.y][b.x] + board[c.y][c.x]
        result = max(result, value)
        return
    }

    for i in index ..< n * n {
        combi(depth + 1, trace + [i], i + 1)
    }
}


let n = Int(readLine()!)!
var board = [[Int]]()
var result = 0

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

combi(0, [], 0)
print(result)