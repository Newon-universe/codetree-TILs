let n = Int(readLine()!)!
let offSet = 100
var result = 0

var board = [[Bool]](repeating: [Bool](repeating: false, count: 210), count: 210)
for _ in 0 ..< n {
    let coordinate = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
    
    for i in coordinate[0] ..< coordinate[0] + 8 {
        for j in coordinate[1] ..< coordinate[1] + 8 {
            if !board[i][j] { result += 1; board[i][j] = true }
        }
    }
}

print(result)