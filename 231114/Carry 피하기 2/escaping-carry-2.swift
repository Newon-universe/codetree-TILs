func carryCheck(_ a: Int, _ b: Int) -> Bool {
    let minimum = Array(String(min(a, b)))
    let maximum = Array(String(max(a, b)))
    
    
    for i in 0 ..< minimum.count {
        if Int(String(minimum[minimum.count - i - 1]))! + Int(String(maximum[maximum.count - i - 1]))! > 9 { return true }
    }

    return false
}

func dfs(_ depth: Int, _ now: Int) -> Int {
    if depth == 3 {
        return now
    }

    var result = 0

    for i in 0 ..< n {
        guard !carryCheck(now, array[i]) && !visited[i] else { continue }

        visited[i] = true
        result = max(dfs(depth + 1, now + array[i]), result)
        visited[i] = false
    }

    return result
}



let n = Int(readLine()!)!
var array = [Int]()
var visited = [Bool](repeating: false, count: n)

for _ in 0 ..< n {
    array.append(Int(readLine()!)!)
}

print(dfs(0, 0))