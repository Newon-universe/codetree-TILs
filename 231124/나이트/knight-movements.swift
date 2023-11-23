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

struct Coordinate: Equatable {
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
    Coordinate(-2, -1, 0),
    Coordinate(-1, -2, 0),
    Coordinate(1, -2, 0),
    Coordinate(2, -1, 0),

    Coordinate(-2, 1, 0),
    Coordinate(-1, 2, 0),
    Coordinate(1, 2, 0),
    Coordinate(2, 1, 0)
]

func solve() -> Int {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    queue.enqueue(start)
    visited[start.y][start.x] = true

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x, now.step + 1)

            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard !visited[next.y][next.x] else { continue }
            if next.y == end.y && next.x == end.x { return next.step }

            visited[next.y][next.x] = true
            queue.enqueue(next)
        }
    }

    return -1
}

let n = Int(readLine()!)!
let source = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
let (start, end) = (Coordinate(source[0], source[1], 0), Coordinate(source[2], source[3], 0))

print(start == end ? 0 : solve())