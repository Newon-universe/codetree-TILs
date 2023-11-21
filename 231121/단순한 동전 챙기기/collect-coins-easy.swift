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

func permutation(_ depth: Int, _ now: [Coordinate]) {
    if depth == 3 {
        solve(now)
        return
    }

    for i in 0 ..< coins.count {
        guard !visited[i] else { continue }

        visited[i] = true
        permutation(depth + 1, now + [coins[i]])
        visited[i] = false
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
var visited = [Bool](repeating: false, count: coins.count)


if coins.count < 3 {
    print(-1)
} else {
    permutation(0, [])
    print(result)
}