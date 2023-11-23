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

func solve(_ lastIceBugs: [Coordinate]) -> [Coordinate] {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
    lastIceBugs.forEach { 
        visited[$0.y][$0.x] = true
        queue.enqueue($0) 
    }
    var meltedIceBugs = [Coordinate]()

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x)

            guard 0 ..< n ~= next.y && 0 ..< m ~= next.x else { continue }
            guard !visited[next.y][next.x] else { continue }

            visited[next.y][next.x] = true
            if board[next.y][next.x] == 1 { meltedIceBugs.append(next); continue }
            queue.enqueue(next)            
        }
    }

    meltedIceBugs.forEach {
        board[$0.y][$0.x] = 0
    }

    return meltedIceBugs
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (source[0], source[1])
var board = [[Int]]()
var resultTime = 0
var meltedIceBugs = [Coordinate(0, 0)]

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for t in 1 ... n * m {
    let nextMelt = solve(meltedIceBugs)

    if nextMelt.count == 0 {
        print(t - 1, meltedIceBugs.count); break
    }
    meltedIceBugs = nextMelt
}