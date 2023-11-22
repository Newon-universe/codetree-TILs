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
        var value = 0
        for element in trace {
            let y = element / n
            let x = element % n
            value += board[y][x]
        }

        result = max(result, value)
        return
    }

    for i in index ..< n * n {
        var flag = false
        
        trace.forEach {
            if $0 / n == i / n || $0 % n == i % n { flag = true }
        }

        if flag { continue }
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