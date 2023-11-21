struct Connection: Equatable, Hashable {
    var y: Int
    var a: Int
    var b: Int
    init(_ y: Int, _ a: Int, _ b: Int) {
        self.y = y
        self.a = a
        self.b = b
    }
}

func combination(_ depth: Int, _ now: Set<Connection>, _ index: Int, _ target: Int) -> [Set<Connection>] {
    if depth == target {
        return [now]
    }

    var result = [Set<Connection>]()
    for i in index ..< m {
        var tempNow = now; tempNow.insert(allLines[i])
        let value = combination(depth + 1, tempNow, i + 1, target) 
        result += (value) 
    }

    return result
}

func find(_ depth: Int, _ now: Int, _ crossLines: Set<Connection>) -> Int {
    if depth == 16 {
        return now
    }
    
    if crossLines.contains(Connection(depth, now, now + 1)) {
        return find(depth + 1, now + 1, crossLines)
    } else if crossLines.contains(Connection(depth, now - 1, now)) {
        return find(depth + 1, now - 1, crossLines)
    } else {
        return find(depth + 1, now, crossLines)
    }
}

let raw = readLine()!.split { $0 == " " }.map { Int($0)! }

let (n, m) = (raw[0], raw[1])
var allLines = [Connection]()
var result = [Int](repeating: -1, count: n)

for _ in 0 ..< m {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    let y = raw[1]
    let x = raw[0]
    allLines.append(Connection(y, x, x + 1))
}

var tempAllLines = Set<Connection>()
allLines.forEach { tempAllLines.insert($0) }
(0 ..< n).forEach {
    result[$0] = find(0, $0, Set<Connection>(tempAllLines))
}

for crossLineCount in 0 ... 15 {
    
    let crossLinesCases = combination(0, [], 0, crossLineCount)
    var flag = false
    
    var tempResult = [Int](repeating: -1, count: n)
    for crossLines in crossLinesCases {
        (0 ..< n).forEach { tempResult[$0] = find(0, $0, crossLines) }

        if tempResult == result {
            print(crossLineCount)
            flag = true
            break
        }
    }

    if flag { break }
}