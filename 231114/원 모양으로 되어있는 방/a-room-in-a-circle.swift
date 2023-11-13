let n = Int(readLine()!)!
var array = [Int]()
var result = Int.max

for _ in 0 ..< n {
    array.append(Int(readLine()!)!)
}

for i in 0 ..< n {
    var temp = 0

    for j in 0 ..< n {
        let index = (j + i) % n
        temp += array[index] * j
    }
    result = min(temp, result)
}

print(result)