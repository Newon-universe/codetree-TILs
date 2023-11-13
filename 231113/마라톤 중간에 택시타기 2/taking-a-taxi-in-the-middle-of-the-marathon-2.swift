struct Coordinate: Hashable {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

func combination(_ depth: Int, _ trace: [Coordinate]) {
    if depth == n - 1 {
        guard trace.count == n - 1 else { return }

        var containStart = false
        var containEnd = false

        if trace[0].y == checkPoints[0].y && trace[0].x == checkPoints[0].x { containStart = true }
        if trace[n - 2].y == checkPoints[n - 1].y && trace[n - 2].x == checkPoints[n - 1].x { containEnd = true }

        if containStart && containEnd { skippedCheckpoints.append(trace) }

        return
    }

    for i in depth ..< n {
        guard !trace.contains(checkPoints[i]) else { continue }

        var nextTrace = trace + [checkPoints[i]]
        combination(depth + 1, nextTrace)
    }
}

let n = Int(readLine()!)!
var checkPoints = [Coordinate]()
var skippedCheckpoints = [[Coordinate]]()
var result = Int.max

for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
    checkPoints.append(Coordinate(raw[1], raw[0]))
}

combination(0, [])

for point in skippedCheckpoints {
    var temp = Coordinate(0, 0)

    for i in 0 ..< point.count {
        temp.x += abs(temp.x - point[i].x)
        temp.y += abs(temp.y - point[i].y)
    }
    
    result = min(temp.x + temp.y, result)
}

print(result)