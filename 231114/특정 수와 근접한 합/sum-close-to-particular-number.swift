func combination(_ depth: Int, _ now: Int, _ index: Int) {
    if depth == 2 {
        result = min(abs((total - now) - S), result)
        return
    }

    for i in index ..< N {
        combination(depth + 1, now + array[i], i + 1)
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, S) = (raw[0], raw[1])
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
let total = array.reduce(0, +)

var result = S

combination(0, 0, 0)
print(result)