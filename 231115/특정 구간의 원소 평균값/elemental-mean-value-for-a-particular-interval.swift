func find(_ target: Int) {
    for i in 0 ..< N {
        guard i + target < N else { break }
        let trace = array[i ... i + target]
        let value = Double(trace.reduce(0, +)) / Double(target + 1)

        for element in trace {
            if Double(element) == value { result += 1; break }
        }
    }
}


let N = Int(readLine()!)!
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = N

for i in 1 ..< N {
    find(i)
}

print(result)