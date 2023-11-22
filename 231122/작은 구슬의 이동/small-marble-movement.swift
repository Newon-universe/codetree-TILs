struct Coordinate {
    var y: Int
    var x: Int
    var direct: String
    init(_ y: Int, _ x: Int, _ direct: String) {
        self.y = y
        self.x = x
        self.direct = direct
    }
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, t) = (source[0], source[1])
let raw = readLine()!.split { $0 == " " }.map { String($0) }

var now = Coordinate(Int(raw[0])!, Int(raw[1])!, raw[2])


for _ in 0 ..< t {
    switch now.direct {
    case "L": 
        guard now.x - 1 > 0 else { now.direct = "R"; break }
        now.x -= 1
    case "R":
        guard now.x + 1 < n else { now.direct = "L"; break }
        now.x += 1
    case "U":
        guard now.y - 1 > 0 else { now.direct = "D"; break }
        now.y -= 1
    case "D":
        guard now.y + 1 < n else { now.direct = "U"; break }
        now.y += 1
    default: break
    }
}

print(now.y, now.x)