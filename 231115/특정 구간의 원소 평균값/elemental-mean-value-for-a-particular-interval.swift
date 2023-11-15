func find(_ depth: Int, _ trace: [Int], _ index: Int, _ target: Int) {
    if depth == target {
        let value = Double(trace.reduce(0, +)) / Double(target)
        for element in trace {
            if Double(element) == value { result += 1; break }
        }

        return
    }

    for i in index ..< N {
        if i > 0 && array[i - 1] != trace.last { continue }
        find(depth + 1, trace + [array[i]], i + 1, target)
    }
}


let N = Int(readLine()!)!
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = N

for i in 2 ... N {
    find(0, [], 0, i)
}

print(result)