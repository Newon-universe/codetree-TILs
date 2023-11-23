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

func solve(_ start: Coordinate) -> Coordinate? {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    let standard = board[start.y][start.x]
    var resultValue = 0
    var resultCoordinate: Coordinate? = nil

    queue.enqueue(start)
    visited[start.y][start.x] = true

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x)

            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard board[next.y][next.x] < standard else { continue }
            guard !visited[next.y][next.x] else { continue }

            if resultCoordinate == nil {
                resultValue = board[next.y][next.x]
                resultCoordinate = Coordinate(next.y, next.x)
            } else if board[next.y][next.x] > resultValue {
                resultValue = board[next.y][next.x]
                resultCoordinate = Coordinate(next.y, next.x)
            } else if board[next.y][next.x] == resultValue && resultCoordinate!.y == next.y && resultCoordinate!.x > next.x {
                resultValue = board[next.y][next.x]
                resultCoordinate = Coordinate(next.y, next.x)
            } else if board[next.y][next.x] == resultValue && resultCoordinate!.y > next.y {
                resultValue = board[next.y][next.x]
                resultCoordinate = Coordinate(next.y, next.x)
            }

            queue.enqueue(next)
            visited[next.y][next.x] = true
        }
    }
    return resultCoordinate
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (source[0], source[1])
var board = [[Int]]()

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
var start = Coordinate(raw[0], raw[1])

for _ in 0 ..< k {
   var temp = solve(start)
   if let next = temp { start = next } else { break }
}

print(start.y + 1, start.x + 1)