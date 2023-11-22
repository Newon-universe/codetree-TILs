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
var now = Coordinate(0, 0)
var temp = 0
var result = -1

for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }.map { String($0) }
    oper.append(raw)
}

for value in oper {
    switch value[0] {
    case "N": 
        for _ in 0 ..< Int(value[1])! {
            now.y -= 1
            temp += 1
            if now.y == 0 && now.x == 0 { break }
        }
    case "S": 
        for _ in 0 ..< Int(value[1])! {
            now.y += 1
            temp += 1
            if now.y == 0 && now.x == 0 { break }
        }
    case "E": 
        for _ in 0 ..< Int(value[1])! {
            now.x += 1
            temp += 1
            if now.y == 0 && now.x == 0 { break }
        }
    case "W": 
        for _ in 0 ..< Int(value[1])! {
            now.x -= 1
            temp += 1
            if now.y == 0 && now.x == 0 { break }
        }
    default: break
    }
    
    if now.y == 0 && now.x == 0 { result = temp; break }
}

print(result)