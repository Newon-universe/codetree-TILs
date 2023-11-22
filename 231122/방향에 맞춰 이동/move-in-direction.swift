struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let n = Int(readLine()!)!
var oper = [[String]]()
var start = Coordinate(0, 0)

for _ in 0 ..< n {
    oper.append(readLine()!.split { $0 == " " }.map { String($0) })
}

oper.forEach {
    switch $0[0] {
    case "N": start.y += Int($0[1])!
    case "S": start.y -= Int($0[1])!
    case "E": start.x += Int($0[1])!
    case "W": start.x -= Int($0[1])!
    default: break
    }
}

print(start.x, start.y)