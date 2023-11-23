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

func solve(_ start: Coordinate) {
    var queue = Queue<Coordinate>()
    board[start.y][start.x] = 1
    result += 1
    queue.enqueue(start)

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x)

            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard board[next.y][next.x] == 0 else { continue }

            board[next.y][next.x] = 1
            queue.enqueue(next)
            result += 1
        }
    }
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (source[0], source[1])
var board = [[Int]]()
var startPoints = [Coordinate]()
var result = 0

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for _ in 0 ..< k {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    startPoints.append(Coordinate(raw[0], raw[1]))
}

for start in startPoints {
    if board[start.y][start.x] == 0 {
        solve(start)
    }
}

print(result)