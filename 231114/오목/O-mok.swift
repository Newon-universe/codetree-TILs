import Foundation

struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

enum Direction: CaseIterable {
    case Up, Down, Left, Right, LeftDown, RightDown
}

func check(_ start: Coordinate) -> Coordinate? {
    let standard = board[start.y][start.x]

    for direct in Direction.allCases {
        switch direct {
        case .Up:
            guard start.y - 4 >= 0 else { break }
            var check = true
            for i in stride(from: start.y, to: start.y - 5, by: -1) {
                if board[i][start.x] != standard { check = false; break }
            }
            guard check else { continue }

            return Coordinate(start.y - 2, start.x)
        
        case .Down:
            guard start.y + 4 < 19 else { break }
            var check = true
            for i in start.y ... start.y + 4 {
                if board[i][start.x] != standard { check = false; break }
            }
            guard check else { continue }
            return Coordinate(start.y + 2, start.x)

        case .Left:
            guard start.x - 4 >= 0 else { break }
            var check = true
            for j in stride(from: start.x, to: start.x - 5, by: -1) {
                if board[start.y][j] != standard { check = false; break }
            }
            guard check else { continue }
            return Coordinate(start.y, start.x - 2)

        case .Right:
            guard start.x + 4 < 19 else { break }
            var check = true
            for j in start.x ... start.x + 4 {
                if board[start.y][j] != standard { check = false; break }
            }
            guard check else { continue }
            return Coordinate(start.y, start.x + 2)
            
        case .LeftDown:
            guard start.y + 4 < 19 && start.x - 4 >= 0 else { break }
            var check = true
            for i in 0 ... 4 {
                if board[start.y + i][start.x - i] != standard { check = false; break }
            }
            guard check else { continue }
            return Coordinate(start.y + 2, start.x - 2)

        case .RightDown:
            guard start.y + 4 < 19 && start.x + 4 < 19 else { break }
            var check = true
            for i in 0 ... 4 {
                if board[start.y + i][start.x + i] != standard { check = false; break }
            }
            guard check else { continue }
            return Coordinate(start.y + 2, start.x + 2)
        }

    }

    return nil
}

var board = [[Int]]()

for _ in 0 ..< 19 {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

var result = 0

for i in 0 ..< 19 {
    for j in 0 ..< 19 {

        if board[i][j] != 0,
           let value = check(Coordinate(i, j)
        ) { 
            result = board[i][j]
            print(board[i][j])
            print("\(value.y + 1) \(value.x + 1)") 
        }
        if result != 0 { break }
    }
    if result != 0 { break }
}

if result == 0 { print(0) }