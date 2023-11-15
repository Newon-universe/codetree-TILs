let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, C, G, H) = (raw[0], raw[1], raw[2], raw[3])
var minimum = Int.max
var maximum = 0
var result = 0

var dataCenter = [[Int]]()

for _ in 0 ..< N {
    let machine = readLine()!.split { $0 == " " }.map { Int($0)! }
    dataCenter.append(machine)
    minimum = min(minimum, machine[0])
    maximum = max(maximum, machine[1])
}

for temp in minimum - 1 ... maximum + 1 {
    var work = 0
    for machine in dataCenter {        
        if temp < machine[0] { work += C }
        else if temp > machine[1] { work += H }
        else { work += G }
    }
    
    result = max(result, work)
}

print(result)