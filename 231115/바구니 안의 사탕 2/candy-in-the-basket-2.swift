let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, K) = (raw[0], raw[1])
var board = [Int](repeating: 0, count: 101)
var result = 0

for _ in 0 ..< N {
    let basket = readLine()!.split { $0 == " " }.map { Int($0)! }
    board[basket[1]] += basket[0]
}

if K <= 50 {
    for i in K ... 100 - K {
        var temp = 0
        for j in i - K ... i + K { temp += board[j] }
        
        result = max(temp, result)
    }
} else {
    result = board.reduce(0, +)
}


print(result)