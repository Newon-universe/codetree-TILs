struct Coordinate: Equatable {
    var y: Double
    var x: Double
    init(_ y: Double, _ x: Double) {
        self.y = y
        self.x = x
    }
}

func combi(_ depth: Int, _ trace: [Coordinate], _ index: Int) {
    if depth == m {
        result = min(solve(trace), result)
        return
    }

    for i in index ..< n {
        combi(depth + 1, trace + [dots[i]], i + 1)
    }
}

func solve(_ trace: [Coordinate]) -> Int {
    var result = Int.max
    for i in 0 ..< trace.count - 1 {
        for j in i + 1 ..< trace.count {
            let value = Int((trace[i].x - trace[j].x) * (trace[i].x - trace[j].x) + (trace[i].y - trace[j].y) * (trace[i].y - trace[j].y))
            result = min(result, value)
        }
    }
    
    return result
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
var dots = [Coordinate]()
var result = 20000

for _ in 0 ..< n {
    let source = readLine()!.split { $0 == " " }.map { Double($0)! }
    dots.append(Coordinate(source[1], source[0]))
}

combi(0, [], 0)
print(result)