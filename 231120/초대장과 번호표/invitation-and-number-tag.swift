func recursive(_ target: Int) -> Set<Int> {
    var result = Set<Int>()
    for i in 0 ..< g {
        board[i].remove(target)
        if board[i].count == 1 { board[i].forEach { result.insert($0) } }
    }

    return result
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, g) = (raw[0], raw[1])
var board = [Set<Int>]()
var visited = [Int:Bool]()
var result = 1

for _ in 0 ..< g {
    var tempSet = Set<Int>()
    readLine()!.split { $0 == " " }[1...].forEach { tempSet.insert(Int($0)!) }
    board.append(tempSet)
}

var target = Set<Int>()
target.insert(1)

while !target.isEmpty {
    var newTarget = Set<Int>()

    target.forEach {
        var values = recursive($0)
        values.forEach { newTarget.insert($0) }
    }
    target = newTarget
    result += newTarget.count
}

print(result)