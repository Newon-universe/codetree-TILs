func draw(_ rect: [Int], _ isDraw: Bool) {
    for i in rect[1] ..< rect[3] {
        for j in rect[0] ..< rect[2] {
            board[i][j] = isDraw
        }
    }
}

func check() {
    var x1 = Int.max
    var y1 = Int.max
    var x2 = Int.min
    var y2 = Int.min

    for i in a[1] ... a[3] {
        for j in a[0] ... a[2] {
            guard board[i][j] else { continue }
            
            x1 = min(x1, j)
            y1 = min(y1, i)
            x2 = max(x2, j)
            y2 = max(y2, i)
            found = true
        }
    }

    if found { print((x2 - x1 + 1) * (y2 - y1 + 1)) }
    else { print(0) }
}

let offSet = 1000
let a = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
let b = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
var found = false

var board = [[Bool]](repeating: [Bool](repeating: false, count: 2001), count: 2001)
draw(a, true)
draw(b, false)
check()