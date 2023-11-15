func permutation(_ depth: Int, _ trace: [Int]) {
    if depth == M {
        beautifulB.append(trace)
        return
    }

    for i in 0 ..< M {
        guard !visited[i] else { continue }
        visited[i] = true
        permutation(depth + 1, trace + [B[i]])
        visited[i] = false
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (raw[0], raw[1])
let A = readLine()!.split { $0 == " " }.map { Int($0)! }
let B = readLine()!.split { $0 == " " }.map { Int($0)! }
var beautifulB = [[Int]]()
var visited = [Bool](repeating: false, count: M)
var result = 0

permutation(0, [])

for i in 0 ... N - M {
    for element in beautifulB {
        if Array(A[i ..< i + M]) == element { result += 1; break }
    }
}

print(result)