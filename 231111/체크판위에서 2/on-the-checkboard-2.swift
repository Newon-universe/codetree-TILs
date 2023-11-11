struct Coordinate {
    var y: Int
    var x: Int

    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

func dfs(_ now: Coordinate, _ depth: Int) -> Int {
    if depth == 3 && now.y == R - 1 && now.x == C - 1 { return 1 }

    var result = 0
    for i in now.y + 1 ..< R {
        for j in now.x + 1 ..< C {

            guard graph[i][j] != graph[now.y][now.x] else { continue }
            result += dfs(Coordinate(i, j), depth + 1)
        }
    }

    return result
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (R, C) = (raw[0], raw[1])

var graph = [[String]]()

for _ in 0 ..< R {
    graph.append(readLine()!.split { $0 == " "}.map { String($0) })
}

print(dfs(Coordinate(0, 0), 0))