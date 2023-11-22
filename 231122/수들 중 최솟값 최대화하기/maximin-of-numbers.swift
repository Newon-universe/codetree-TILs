func find(_ depth: Int, _ value: Int) {
    if depth == n {
        result = max(result, value)
        return
    }

    for j in 0 ..< n {
        guard !visited[j] else { continue }

        visited[j] = true
        find(depth + 1, min(value, board[depth][j]))
        visited[j] = false
    }
}

let n = Int(readLine()!)!
var visited = [Bool](repeating: false, count: n)
var board = [[Int]]()
var result = 0

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

find(0, 10001)
print(result)