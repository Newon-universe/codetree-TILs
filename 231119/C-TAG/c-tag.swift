func combination(_ depth: Int, _ trace: [Int], _ index: Int) {
    if depth == 3 {
        applicant.append(trace)
        return
    }

    for i in index ..< m {
        combination(depth + 1, trace + [i], i + 1)
    }
}


let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
var board = [[String]]()
var applicant = [[Int]]()
var result = 0

for _ in 0 ..< 2 * n {
    board.append(Array(readLine()!).map { String($0) })
}

combination(0, [], 0)

for indices in applicant {
    var aSet = Set<String>()
    var bSet = Set<String>()
    var count = 1
    
    for i in 0 ..< n {
        var a = ""
        for j in indices {
            a += board[i][j]
        }
        aSet.insert(a)
    }
    
    for i in n ..< 2 * n {
        var b = ""
        for j in indices {
            b += board[i][j]
        }
        bSet.insert(b)
    }

    for a in aSet {
        if bSet.contains(a) { count -= 1; break }
    }

    result += count
}

print(result)