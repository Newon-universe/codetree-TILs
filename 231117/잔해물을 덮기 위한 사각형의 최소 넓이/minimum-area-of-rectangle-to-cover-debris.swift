func draw(_ rect: [Int], _ isDraw: Bool) {
    for i in rect[1] ..< rect[3] {
        for j in rect[0] ..< rect[2] {
            if isDraw { board[i][j] = true; result += 1 }
            else { board[i][j] = false; if board[i][j] { result -= 1 } }
        }
    }
}


let offSet = 1000
let a = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
let b = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
var result = 0

var board = [[Bool]](repeating: [Bool](repeating: false, count: 2001), count: 2001)
draw(a, true)
draw(b, false)
print(result)