func combination(_ depth: Int, _ now: [Int], _ index: Int) {
    if depth == m {
        now.forEach {
            result += "\($0) "
        }
        result += "\n"
    }

    for i in index ..< n {
        combination(depth + 1, now + [array[i]], i + 1)
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
let array = Array(1...n)
var result = ""

combination(0, [], 0)
print(result)