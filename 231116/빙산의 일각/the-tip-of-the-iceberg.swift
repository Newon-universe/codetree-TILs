let n = Int(readLine()!)!
var iceBugs = [Int]()
var result = 0

for _ in 0 ..< n {
    iceBugs.append(Int(readLine()!)!)
}

for water in 0 ... 1000 {
    var temp = iceBugs[0] > water ? 1 : 0

    for i in 1 ..< n {
        if iceBugs[i] > water && iceBugs[i - 1] <= water { temp += 1 }
    }

    result = max(temp, result)
}

print(result)