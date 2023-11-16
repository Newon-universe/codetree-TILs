let n = Int(readLine()!)!
var start = 1000
var graph = [Int](repeating: 0, count: 2001)
var result = 0
var sIndex: Int? = nil


for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }
    let x = Int(raw[0])!
    
    if raw[1] == "R" { for i in start ... start + x { graph[i] += 1 }; start += x }
    else { for i in stride(from:start, through: start - x, by: -1) { graph[i] += 1 }; start -= x }
}

for i in 0 ... 2000 {
    if graph[i] > 1 && sIndex == nil { sIndex = i }
    if graph[i] < 2, let index = sIndex { sIndex = nil; result += abs(i - index) - 1 }
}

print(result)