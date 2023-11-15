import Foundation

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (t, a, b) = (raw[0], raw[1], raw[2])
var board = [String](repeating: "", count: b + 1)
var last = [String:Int]()
var result: Double = 0

for _ in 0 ..< t {
    let location = readLine()!.split { $0 == " " }
    board[Int(location[1])!] = String(location[0])
}


for i in a ... b {
    if board[i] == "S" { 
        last["S"] = i
        guard last["N"] != nil else { continue }
        result += Double(i) - ceil(Double((last["N"]! + i)) / Double(2)) + Double(1)
    } else if board[i] == "N" {
        last["N"] = i
        guard last["S"] != nil else { continue }
        result += Double(i) - ceil(Double((last["S"]! + i)) / Double(2)) + Double(1)
    }
}

print(Int(result))