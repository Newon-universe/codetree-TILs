let n = Int(readLine()!)!
var board = [String](repeating: "", count: 101)
var result = 0

for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }
    board[Int(raw[0])!] = String(raw[1])
}

for range in 2 ... 50 {
    for i in 0 ... 101 - range {
        if board[i] == "" { continue }
        var gCount = 0
        var hCount = 0
        var last = i

        for j in i ..< i + range {
            if board[j] == "G" { gCount += 1; last = j }
            else if board[j] == "H" { hCount += 1; last = j }
        }

        if gCount == range || hCount == range || (gCount == hCount && gCount != 0) && last - i > result {
            result = last - i
        }
    }
}

print(result)