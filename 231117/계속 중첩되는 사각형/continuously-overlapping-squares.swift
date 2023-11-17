let n = Int(readLine()!)!
let offSet = 100

var board = [[Bool]](repeating: [Bool](repeating: false, count: 201), count: 201)
var result = 0

for time in 0 ..< n {
    let rect = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
    let blue = time % 2 == 1

    for i in rect[1] ..< rect[3] {
        for j in rect[0] ..< rect[2] {
            board[i][j] = blue
        }
    }
}

for i in 0 ..< 201 {
    for j in 0 ..< 201 {
        if board[i][j] { result += 1 }
    }
}

print(result)