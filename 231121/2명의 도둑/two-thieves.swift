struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

func check(_ depth: Int, _ position: Coordinate, _ weight: Int, _ value: Int) -> Int {
    if depth == m {
        // 68 + 36 + 16
        // 68 + 52
        // 120

        guard weight <= c else { return 0 }
        return value
    }
    
    var result = 0

    let y = position.y
    let x = position.x
    let newWeight = board[y][x] + weight
    let newValue = (board[y][x] * board[y][x]) + value
    
    result = max(check(depth + 1, Coordinate(y, x + 1), newWeight, newValue), check(depth + 1, Coordinate(y, x + 1), weight, value))
    return result
}

func combination(_ depth: Int, _ now: [Coordinate], _ index: Int) {
    if depth == 2 {
        var temp = 0
        for position in now {
            temp += check(0, position, 0, 0)
        }
        
        result = max(temp, result)
        return
    }

    for i in index ..< n * n {
        let next = Coordinate(i / n, i % n)
        if let last = now.last,
            last.x ... last.x + m ~= next.x && last.y == next.y { continue }
        guard 0 ... n ~= next.x + m else { continue }

        combination(depth + 1, now + [next], i + 1)
    }
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m, c) = (source[0], source[1], source[2])

var board = [[Int]]()
var result = 0

for _ in 0 ..< n {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

combination(0, [], 0)
print(result)