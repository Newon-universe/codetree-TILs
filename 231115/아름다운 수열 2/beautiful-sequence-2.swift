func solve() {
    for i in 0 ... N - M {
        let standard = A[i ..< i + M]
        var visited = [Bool](repeating: false, count: M)

        standard.forEach {
            for j in 0 ..< M {
                guard !visited[j] else { continue }
                if B[j] == $0 { visited[j] = true }
            }
        }

        if visited.allSatisfy { $0 == true } { result += 1 }
    }
}


let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (raw[0], raw[1])
let A = readLine()!.split { $0 == " " }.map { Int($0)! }
let B = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = 0

solve()

print(result)