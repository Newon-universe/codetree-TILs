import Foundation

struct Coordinate: Hashable {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

let n = Int(readLine()!)!
var checkPoints = [Coordinate]()
var result = Int.max

for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
    checkPoints.append(Coordinate(raw[1], raw[0]))
}

for i in 1 ..< n - 1 {
    var temp = Coordinate(0, 0)
    var distance = 0

    for j in 0 ..< n {
        if i == j { continue }

        temp.x = abs(temp.x - checkPoints[j].x)
        temp.y = abs(temp.y - checkPoints[j].y)
        distance += temp.x + temp.y
    }

    result = min(distance, result)
}

print(result)