let n = Int(readLine()!)!
var result = 0
var board = [[Int]]()

var dictA = [Int:Int]()
var dictB = [Int:Int]()

for _ in 0 ..< 4 {
    board.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for i in 0 ..< n {
    for j in 0 ..< n {
        let value1 = board[0][i] + board[1][j]
        let value2 = board[2][i] + board[3][j]

        dictA[value1, default: 0] += 1
        dictB[value2, default: 0] += 1
    }
}

for aKey in dictA.keys {
    if dictB[-aKey] != nil {
        result += dictA[aKey, default: 0] * dictB[-aKey, default: 0]
    }
}

print(result)