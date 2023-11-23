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

func combi(_ depth: Int, _ trace: [Int], _ index: Int) -> [[Coordinate]] {
    if depth == k {
        var positions = [Coordinate]()
        trace.forEach { positions.append(Coordinate($0 / n, $0 % n)) }
        return [positions]
    }

    var result = [[Coordinate]]()
    for i in index ..< n * n {
        result += combi(depth + 1, trace + [i], i + 1)
    }

    return result
}

func solve(_ cities: [Coordinate]) -> Int {
    var queue = Queue<Coordinate>()
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
    var count = cities.count

    cities.forEach { city in
        visited[city.y][city.x] = true
        queue.enqueue(city) 
    }

    while !queue.isEmpty {
        let now = queue.dequeue()

        for direct in directions {
            let next = Coordinate(now.y + direct.y, now.x + direct.x)

            guard 0 ..< n ~= next.y && 0 ..< n ~= next.x else { continue }
            guard u ... d ~= abs(board[now.y][now.x] - board[next.y][next.x]) else { continue }
            guard !visited[next.y][next.x] else { continue }

            visited[next.y][next.x] = true
            queue.enqueue(next)
            count += 1
        }
    }

    return count
}


let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k, u, d) = (source[0], source[1], source[2], source[3])

var board = [[Int]]()
for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}
var result = 0

for cities in combi(0, [], 0) {
    result = max(solve(cities), result)
}

print(result)