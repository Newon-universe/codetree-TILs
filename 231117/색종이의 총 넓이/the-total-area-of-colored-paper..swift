let n = Int(readLine()!)!
let offSet = 100
var result = 0

var board = [[Bool]](repeating: [Bool](repeating: false, count: 201), count: 201)
for _ in 0 ..< n {
    let coordinate = readLine()!.split { $0 == " " }.map { Int($0)! }
    
    for i in coordinate[0] ..< coordinate[0] + 8 {
        for j in coordinate[1] ..< coordinate[0] + 8 {
            if !board[i][j] { result += 1; board[i][j] = true }
        }
    }
}

print(result)