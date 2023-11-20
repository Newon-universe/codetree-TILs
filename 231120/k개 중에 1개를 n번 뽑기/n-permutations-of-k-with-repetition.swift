func recursive(_ depth: Int, _ now: [Int]) {
    if depth == n {
        now.forEach { result += "\($0) " }
        result += "\n"
        return
    }

    for i in 0 ..< k {
        recursive(depth + 1, now + [array[i]])
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (k, n) = (raw[0], raw[1])
let array = Array(1...k)
var result = ""

recursive(0, [])

print(result)