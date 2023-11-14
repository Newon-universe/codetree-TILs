struct Coordinate: Equatable {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

func combination(_ depth: Int, _ trace: [Coordinate]) {
    if depth == 2 {
        applicant.append(trace)
        return
    }

    for i in (trace.last?.y ?? 0) ..< n {
        for j in (trace.last?.x ?? 0) ..< n {
            if trace.last?.y == i && (trace.last?.x ?? n) ... (trace.last?.x ?? n) + 2 ~= j { continue }
            
            combination(depth + 1, trace + [Coordinate(i, j)])
        }
    }
}

func find(_ start: Coordinate) -> Int {
    var count = 0
    guard start.x + 2 < n else { return 0 }
    graph[start.y][start.x ... start.x + 2].map { if $0 == 1 { count += 1 } }
    return count
}


let n = Int(readLine()!)!
var graph = [[Int]]()
var applicant = [[Coordinate]]()
var result = 0

for _ in 0 ..< n {
    graph.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

combination(0, [])

for candi in applicant {
    var temp = find(candi[0]) + find(candi[1])
    result = max(temp, result)
}

print(result)