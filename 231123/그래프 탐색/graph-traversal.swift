func dfs(_ depth: Int, _ now: Int) {
    
    for j in 0 ..< n {
        guard board[now][j] else { continue }
        guard !visited[j] else { continue }

        visited[j] = true
        dfs(depth + 1, j)
    }

}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (source[0], source[1])
var board = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var result = Set<Int>()

for _ in 0 ..< m {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }

    board[raw[0]][raw[1]] = true
    board[raw[1]][raw[0]] = true
}

var visited = [Bool](repeating: false, count: n)
visited[0] = true
dfs(0, 0)
print(visited.filter { $0 == true }.count - 1)