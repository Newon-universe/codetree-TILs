func draw(_ rect: [Int], _ isDraw: Bool) {
    for i in min(rect[1], rect[3]) ..< max(rect[1], rect[3]) {
        for j in min(rect[0], rect[2]) ..< max(rect[0], rect[2]) {
            if isDraw { board[i][j] = true; count += 1 }
            else { if board[i][j] { count -= 1 }; board[i][j] = false }
        }
    }
}

func check() {
    var leftX = a[0]
    var leftY = a[1]
    var rightX = a[2]
    var rightY = a[3]

    for i in a[1] ..< a[3] {
        for j in a[0] ..< a[2] {
            
            guard board[i][j] else { continue }
            
            if leftX > j { leftX = j }
            if rightX < j { rightX = j }
            if leftY > i { leftY = i }
            if rightY < i { rightY = i }

        }
    }

    print(abs(rightX - leftX) * abs(rightY - leftY))
}

let offSet = 1000
let a = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
let b = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
var count = 0

var board = [[Bool]](repeating: [Bool](repeating: false, count: 2001), count: 2001)
draw(a, true)
draw(b, false)


if count == 0 { print(0) }
else { check() }