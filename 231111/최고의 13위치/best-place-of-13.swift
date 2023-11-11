let n = Int(readLine()!)!
var graph = [[Int]]()
var result = 0

for _ in 0 ..< n {
    graph.append(readLine()!.split { $0 == " " }.map { Int($0)! })
}

for i in 0 ..< n {
    for j in 0 ..< n {

        guard j + 2 < n else { continue }
        var temp = 0

        for k in j ... j + 2 {
            if graph[i][k] == 1 { temp += 1 }
        }
        
        result = max(temp, result)
    }
}

print(result)