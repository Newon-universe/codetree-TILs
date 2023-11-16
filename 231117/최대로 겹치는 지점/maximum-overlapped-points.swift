let n = Int(readLine()!)!
var graph = [Int](repeating: 0, count: 201)
var result = 0
for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! } 
    for i in raw[0] ... raw[1] {
        graph[i] += 1
        result = max(result, graph[i])
    }
}

print(result)