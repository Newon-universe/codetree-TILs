func draw(_ rect: [Int], _ draw: Bool) {
    for i in rect[1] ..< rect[3] {
        for j in rect[0] ..< rect[2] {
            if draw { board[i][j] += 1; result += 1 }
            else { if board[i][j] == 1 { result -= 1 }; board[i][j] -= 1  }
        }
    }
}

var board = [[Int]](repeating: [Int](repeating: 0, count: 2001), count: 2001)

let A = readLine()!.split { $0 == " " }.map { Int($0)! }
let B = readLine()!.split { $0 == " " }.map { Int($0)! }
let M = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = 0

draw(A, true)
draw(B, true)
draw(M, false)
print(result)