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

func solve() {
    var queue = Queue<Coordinate>()
    rotten.forEach { queue.enqueue($0) }

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x, now.step + direct.step)

            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard board[next.y][next.x] == 1 else { continue }

            board[next.y][next.x] = 2
            result[next.y][next.x] = next.step
            queue.enqueue(next)
        }
    }
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (source[0], source[1])
var board = [[Int]]()
var rotten = [Coordinate]()
var result = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)
var resultTemplate = ""

for i in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.enumerated().map { j, raw in
        let value = Int(String(raw))!
        if value == 2 { 
            rotten.append(Coordinate(i,j,0))
            result[i][j] = 0
        }
        if value == 1 {
            result[i][j] = -2
        }
        return value
    })
}

solve()
for plate in result {
    plate.forEach {
        resultTemplate += "\($0) "
    }
    resultTemplate += "\n"
}

print(resultTemplate)