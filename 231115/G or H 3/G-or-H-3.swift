let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, K) = (raw[0], raw[1])
var result = 0

var board = [Int](repeating: 0, count: 10001)
for _ in 0 ..< N {
    let value = readLine()!.split { $0 == " " }
    let index = Int(value[0])!
    let score = value[1] == "G" ? 1 : 2
    board[index] = score
}

for i in 1 ..< 10001 - K {
    result = max(board[i ... i + K].reduce(0, +), result)
}

print(result)