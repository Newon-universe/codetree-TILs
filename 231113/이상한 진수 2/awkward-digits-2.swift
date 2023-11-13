func makeDecimal() -> Int {
    var result = 0
    for i in stride(from: array.count - 1, to: -1, by: -1) {
        if array[i] == "1" {
            var temp = 1
            for _ in 0 ... i { temp *= 2 }
            result += temp
        }
    }

    return result
}

func solve() {    
    for i in 0 ..< array.count {
        if array[i] == "0" { 
            array[i] = "1"; 
            return
        }
    }

    array[array.count - 1] = "0"
    return
}


var array = Array(readLine()!.map { String($0) })

solve()
print(makeDecimal())