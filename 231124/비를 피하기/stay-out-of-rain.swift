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
    Coordinate(-1, 0, 0),
    Coordinate(1, 0, 0),
    Coordinate(0, -1, 0),
    Coordinate(0, 1, 0)
]

func solve(_ start: Coordinate) -> Int {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)

    queue.enqueue(start)
    visited[start.y][start.x] = true

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x, now.step + 1)

            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard board[next.y][next.x] != 1 else { continue }
            guard !visited[next.y][next.x] else { continue }
            
            if board[next.y][next.x] == 3 { return next.step }

            visited[next.y][next.x] = true
            queue.enqueue(next)
        }
    }

    return -1
}


let source = readLine()!.split { $0 == " "}.map { Int($0)! }
let (n, h, m) = (source[0], source[1], source[2])
var board = [[Int]]()
var person = [Coordinate]()
var result = ""

for i in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for i in 0 ..< n {
    for j in 0 ..< n {
        if board[i][j] == 2 { result += "\(solve(Coordinate(i, j, 0))) " }
        else { result += "0 " }
    }
    result += "\n"
}

print(result)