func combination(_ depth: Int, _ now: [Int], _ index: Int) {
    if depth == m {
        var temp = 0
        now.forEach { temp = temp ^ $0 }
        result = max(temp, result)
        return
    }
    
    for i in index ..< n {
        combination(depth + 1, now + [array[i]], i + 1)
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = 0

combination(0, [], 0)
print(result)