func combination(_ depth: Int, _ trace: [Int], _ index: Int) {
    if depth == N - 2 {
        result = min(abs(trace.reduce(0, +) - S), result)
    }

    for i in index ..< N {
        combination(depth + 1, trace + [array[i]], i + 1)
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, S) = (raw[0], raw[1])
let array = readLine()!.split { $0 == " " }.map { Int($0)! }

var result = S

combination(0, [], 0)
print(result)