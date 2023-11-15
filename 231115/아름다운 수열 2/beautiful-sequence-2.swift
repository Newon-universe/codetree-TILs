func solve() {
    guard N - M > 0 else { return }
    for i in 0 ... N - M {
        if Array(A[i ..< i + M]).sorted() == B {
            result += 1
        }
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, M) = (raw[0], raw[1])
let A = readLine()!.split { $0 == " " }.map { Int($0)! }
let B = readLine()!.split { $0 == " " }.map { Int($0)! }.sorted()
var result = 0

solve()

print(result)