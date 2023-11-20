func duplicatedCheck(_ a: [Int], _ b: [Int]) -> Bool {
    if a[0] ... a[1] ~= b[0] || a[0] ... a[1] ~= b[1] { return true }
    return false
}

func checker(_ depth: Int, _ now: [[Int]], _ index: Int) {
    if depth == n {
        return
    }

    result = max(now.count, result)

    for i in index ..< lines.count {

        var isDuplicated = false
        for line in now {
            isDuplicated = duplicatedCheck(line, lines[i])
            if isDuplicated { break }
        }
        guard !isDuplicated else { continue }

        checker(depth + 1, now + [lines[i]], i + 1)
    }
}

let n = Int(readLine()!)!
var lines = [[Int]]()
var visited = [Bool](repeating: false, count: n)
var result = 0

for _ in 0 ..< n {
    lines.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

checker(0, [lines[0]], 0)
print(result)