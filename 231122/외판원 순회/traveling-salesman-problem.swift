func detour(_ depth: Int, _ cost: Int, _ y: Int) {
    if depth == n - 1 {
        result = min(cost + board[y][0], result)
        return
    }
    

    for x in 1 ..< n {
        guard !visited[x] else { continue }
        guard x != y else { continue }
        guard board[y][x] != 0 else { continue }

        visited[x] = true
        detour(depth + 1, cost + board[y][x], x)
        visited[x] = false
    }
}

// 0 2 1 3 4

// 0 + 0 + 8 + 6 + 3

let n = Int(readLine()!)!
var board = [[Int]]()
var visited = [Bool](repeating: false, count: n)
var result = Int.max

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

detour(0, 0, 0)
print(result)