struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let directions = [
    Coordinate(1, 0),
    Coordinate(0, 1),
    Coordinate(-1, 0),
    Coordinate(0, -1)
]

var oper = Array(readLine()!).map { String($0) }
var dIndex = 0
var now = Coordinate(0, 0)
var temp = 0
var result = -1

for value in oper {
    switch value {
    case "L": if dIndex - 1 < 0 { dIndex = 3 } else { dIndex -= 1 }
    case "R": dIndex = (dIndex + 1) % 4
    case "F": now.y += directions[dIndex].y; now.x += directions[dIndex].x
    default: break
    }

    temp += 1
    if now.y == 0 && now.x == 0 { result = temp; break }
}

print(result)