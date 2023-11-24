struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    mutating func enqueue(_ node: T) {
        input.append(node)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

struct Coordinate {
    var y: Int
    var x: Int
    var step: Int
    init(_ y: Int, _ x: Int, _ step: Int) {
        self.y = y
        self.x = x
        self.step = step
    }
}

let directions = [
    Coordinate(-1, 0, 1),
    Coordinate(1, 0, 1),
    Coordinate(0, -1, 1),
    Coordinate(0, 1, 1)
]

func combi(_ depth: Int, _ trace: [Coordinate], _ index: Int) -> [[Coordinate]] {
    if depth == k {
        return [trace]
    }

    var result = [[Coordinate]]()
    for i in index ..< walls.count {
        result += combi(depth + 1, trace + [walls[i]], i + 1)
    }

    return result
}

func solve() -> Int {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    queue.enqueue(start)
    visited[start.y][start.x] = true

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x, now.step + direct.step)

            if next.y == end.y && next.x == end.x { return next.step }
            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard !visited[next.y][next.x] else { continue }
            guard board[next.y][next.x] == 0 else { continue }

            visited[next.y][next.x] = true
            queue.enqueue(next)
        }
    }

    return Int.max
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (source[0], source[1])
var walls = [Coordinate]()

var board = [[Int]]()
for i in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.enumerated().map { j, raw in
        let value = Int(String(raw))!
        if value == 1 { walls.append(Coordinate(i, j, 0)) }
        return value
    })
}

var raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
let start = Coordinate(raw[0], raw[1], 0)
raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
let end = Coordinate(raw[0], raw[1], 0)
var result = Int.max

combi(0, [], 0).forEach { combis in
    
    combis.forEach { board[$0.y][$0.x] = 0 }
    result = min(solve(), result)
    combis.forEach { board[$0.y][$0.x] = 1 }
    
}

print(result == Int.max ? -1 : result)