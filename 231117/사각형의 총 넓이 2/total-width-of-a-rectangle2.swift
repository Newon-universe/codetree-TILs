let n = Int(readLine()!)!
let offSet = 100
var result = 0

var board = [[Int]](repeating: [Int](repeating: 0, count: 201), count: 201)
for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! + offSet }
    
    for i in raw[1] ..< raw[3] {
        for j in raw[0] ..< raw[2] {
            if board[i][j] == 0 { result += 1 }
            board[i][j] = 1
        }
    }
}

print(result)