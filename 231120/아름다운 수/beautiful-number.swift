func isBeautiful(_ now: [Int]) -> Bool {
    var i = 0
    while i < n {
        if i + now[i] - 1 >= n { return false }

        for j in i ..< i + now[i] {
            if now[j] != now[i] { return false }
        }

        i += now[i]
    }

    return true
}


func countBeatutifulSeq(_ depth: Int, _ now: [Int]) {
    if depth == n {
        if isBeautiful(now) { result += 1 }
        return
    }

    for i in 0 ..< 4 {
        countBeatutifulSeq(depth + 1, now + [array[i]])
    }
}

let n = Int(readLine()!)!
let array = Array(1...4)
var visited = [Bool](repeating: false, count: n)
var result = 0

countBeatutifulSeq(0, [])
print(result)