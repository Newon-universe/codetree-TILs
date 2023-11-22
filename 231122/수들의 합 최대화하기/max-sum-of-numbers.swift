func combi(_ depth: Int, _ y: Int, _ value: Int) {
    if depth == n {
        result = max(result, value)
        return
    }

    for x in 0 ..< n {
        guard !visited[x] else { continue }
        
        visited[x] = true 
        combi(depth + 1, y + 1, value + board[y][x])
        visited[x] = false
    }
}


let n = Int(readLine()!)!
var board = [[Int]]()
var visited = [Bool](repeating: false, count: n)
var result = 0

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

combi(0, 0, 0)
print(result)