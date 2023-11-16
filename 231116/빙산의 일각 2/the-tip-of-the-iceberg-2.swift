let n = Int(readLine()!)!
var iceBugs = [Int]()
var result = 0

for _ in 0 ..< n {
    iceBugs.append(Int(readLine()!)!)
}

for water in 0 ... 1000 {
    var temp = 0
    var isIce = false

    for i in 0 ..< n - 1 {
        isIce = iceBugs[i] > water
        let isNextIce = iceBugs[i + 1] > water

        if isIce && !isNextIce { temp += 1 }
    }

    result = max(temp, result)
}

print(result)