struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    mutating func enqueue(_ node: T){
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
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let directions = [
    Coordinate(-1, 0),
    Coordinate(1, 0),
    Coordinate(0, -1),
    Coordinate(0, 1)
]

func combi(_ depth: Int, _ trace: [Coordinate], _ index: Int) -> [[Coordinate]]{
    if depth == m {
        return [trace]
    }

    var result = [[Coordinate]]()
    for i in index ..< rocks.count {
        result += combi(depth + 1, trace + [rocks[i]], i + 1)
    }

    return result
}

func solve(_ start: Coordinate, _ visited: inout [[Bool]]) -> Int {
    guard !visited[start.y][start.x] else { return 0 }
    var queue = Queue<Coordinate>()
    var count = 1

    queue.enqueue(start)
    visited[start.y][start.x] = true

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x)

            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard board[next.y][next.x] == 0 else { continue }
            guard !visited[next.y][next.x] else { continue }

            visited[next.y][next.x] = true
            queue.enqueue(next)
            count += 1
        }
    }

    return count
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k, m) = (source[0], source[1], source[2])
var board = [[Int]]()
var rocks = [Coordinate]()
var startPoints = [Coordinate]()
var result = 0

for i in 0 ..< n {
    board.append(
        readLine()!.split { $0 == " " }.enumerated().map { j, raw in
            let value = Int(raw)! 
            if value == 1 { rocks.append(Coordinate(i, j)) }
            return value
        }
    )
}

for _ in 0 ..< k {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    startPoints.append(Coordinate(raw[0], raw[1]))
}

for removeRock in combi(0, [], 0) {
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var temp = 0

    removeRock.forEach { board[$0.y][$0.x] = 0 }
    startPoints.forEach { temp += solve($0, &visited) }
    removeRock.forEach { board[$0.y][$0.x] = 1 }
    
    result = max(temp, result)
}

print(result)