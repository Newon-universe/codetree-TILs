struct Coordinate {
    var y: Int
    var x: Int
    init(_ y: Int, _ x: Int) {
        self.y = y
        self.x = x
    }
}

func find(_ start: Coordinate) -> Int {
    var count = 0
    graph[start.y][start.x ... start.x + 2].map { if $0 == 1 { count += 1 } }
    return count
}


let n = Int(readLine()!)!
var graph = [[Int]]()
var result = 0

for _ in 0 ..< n {
    graph.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for i in 0 ..< n {

    for j in 0 ..< n - 2 {
        let temp = find(Coordinate(i, j))

        if j == n - 3 && i < n - 1{
            let value = find(Coordinate(i + 1, 0))
            result = max(temp + value, result)
        } else {
            for k in j + 1 ..< n - 2 {
                let value = find(Coordinate(i, k))
                result = max(temp + value, result)
            }
        }
    }
    
}

print(result)