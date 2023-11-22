func detour(_ depth: Int, _ cost: Int, _ now: Int) {
    if depth == n {
        result = min(cost + board[now][0], result)
        return
    }

    for i in 0 ..< n {
        guard !visited[i] else { continue }
        guard i != now else { continue }

        visited[i] = true
        detour(depth + 1, cost + board[now][i], i)
        visited[i] = false
    }
}

let n = Int(readLine()!)!
var board = [[Int]]()
var visited = [Bool](repeating: false, count: n)
var result = Int.max

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

detour(0, 0, 0)
print(result)