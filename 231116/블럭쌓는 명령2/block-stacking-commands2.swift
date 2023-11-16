let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, K) = (raw[0], raw[1])

var graph = [Int](repeating: 0, count: N)
var result = 0

for _ in 0 ..< K {
    let value = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    for i in value[0] ... value[1] {
        graph[i] += 1
        result = max(graph[i], result)
    }
}

print(result)