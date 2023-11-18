func find(_ depth: Int, _ now: Int) {
    if depth == 4 {
        if now == 0 { result += 1 }
        return
    }

    for i in 0 ..< n {
        find(depth + 1, now + board[depth][i])
    }
}

let n = Int(readLine()!)!
var result = 0

var board = [[Int]]()
for _ in 0 ..< 4 {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

find(0, 0)
print(result)