let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
var result = ""

var dict = [Int:Int]()
readLine()!.split { $0 == " " }.map { Int($0)! }.forEach { 
    dict[$0, default: 0] += 1
}

readLine()!.split { $0 == " " }.map { Int($0)! }.forEach {
    result += "\(dict[$0, default: 0]) "
}

print(result)