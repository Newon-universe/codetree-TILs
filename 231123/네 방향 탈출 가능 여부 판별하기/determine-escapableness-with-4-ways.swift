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
    init(_ y: Int, _ x :Int) {
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

func solve() {
    var queue = Queue<Coordinate>()
    queue.enqueue(Coordinate(0, 0))

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x)

            guard 0 ..< n ~= next.y && 0 ..< m ~= next.x else { continue }
            guard board[next.y][next.x] == 1 else { continue }
            if next.y == n - 1 && next.x == n - 1 { result = 1; return }

            board[next.y][next.x] = 2
            queue.enqueue(next)
        }
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
var result = 0

var board = [[Int]]()
for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

solve()
print(result)