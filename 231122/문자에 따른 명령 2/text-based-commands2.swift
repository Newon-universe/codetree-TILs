struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let directions = [
    Coordinate(-1, 0),
    Coordinate(0,1),
    Coordinate(1, 0),
    Coordinate(0, -1)
]

var directIndex = 0
var now = Coordinate(0, 0)
let oper = Array(readLine()!).map { String($0) }

oper.forEach {
    switch $0 {
    case "L": directIndex = directIndex == 0 ? 3 : directIndex - 1
    case "R": directIndex = directIndex == 3 ? 0 : directIndex + 1
    case "F": now.y += directions[directIndex].y; now.x += directions[directIndex].x
    default: break
    }
}

print(now.x, now.y)