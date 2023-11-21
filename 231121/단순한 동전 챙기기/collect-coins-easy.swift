struct Coordinate {
    var y: Int
    var x: Int
    var value: Int
    init(_ y: Int, _ x: Int, _ value: Int) {
        self.y = y
        self.x = x
        self.value = value
    }
}

func combination(_ depth: Int, _ now: [Coordinate], _ index: Int) {
    if depth == 3 {
        solve(now)
        return
    }

    for i in index ..< coins.count {
        combination(depth + 1, now + [coins[i]], i + 1)
    }
}

func solve(_ routes: [Coordinate]) {
    var now = start
    var count = 0

    for position in routes {
        count += abs(now.y - position.y) + abs(now.x - position.x)
        now = position
    }

    count += abs(now.y - end.y) + abs(now.x - end.x)
    result = min(result, count)
}


let n = Int(readLine()!)!
var board = [[String]]()
var start = Coordinate(0, 0, 0)
var end = Coordinate(0, 0, 10)
var coins = [Coordinate]()
var result = Int.max

for i in 0 ..< n {
    readLine()!.enumerated().forEach { j, raw in 
        let value = String(raw)
        if value == "S" { start = Coordinate(i, j, 0) }
        else if value == "E" { end = Coordinate(i, j, 10) }
        else if value != "." { coins.append(Coordinate(i, j, Int(value)!)) }
    }
}

if coins.count < 3 {
    print(-1)
} else {
    combination(0, [], 0)
    print(result)
}