func permu(_ depth: Int, _ trace: [Int]) {
    if depth == n {
        trace.forEach { result += "\($0) " }
        result += "\n"
        return
    }

    for i in 0 ..< n {
        guard !visited[i] else { continue }

        visited[i] = true
        permu(depth + 1, trace + [i + 1])
        visited[i] = false
    }
}

let n = Int(readLine()!)!
var visited = [Bool](repeating: false, count: n)
var result = ""

permu(0, [])
print(result)