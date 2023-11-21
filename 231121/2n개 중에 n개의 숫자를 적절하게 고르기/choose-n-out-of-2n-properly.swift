func combi(_ depth: Int, _ trace: [Int], _ index: Int) {
    if depth == n {
        let sum = trace.reduce(0, +)
        result = min(abs((totalSum - sum) - sum), result)
        return
    }

    for i in index ..< 2 * n {
        combi(depth + 1, trace + [array[i]], i + 1)
    }
}

let n = Int(readLine()!)!
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
let totalSum = array.reduce(0, +)
var result = Int.max

combi(0, [], 0)
print(result)