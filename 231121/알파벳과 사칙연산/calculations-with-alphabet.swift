func permutation(_ depth: Int, _ now: [Int]) -> [[Int]] {
    if depth == 6 {
        return [now]
    }

    var result = [[Int]]()
    for i in 0 ..< 4 {
        result += permutation(depth + 1, now + [array[i]])
    }
    return result
}

func solve(_ standard: [Int]) {
    var temp = 0
    var tempOperator: Character? = nil

    for i in 0 ..< equation.count {
        if i % 2 == 0 {
            let index = Int(equation[i].asciiValue! - offSet)
            let value = standard[index]
            
            if let oper = tempOperator {
                switch oper {
                case "+": temp += value
                case "-": temp -= value
                case "*": temp *= value
                default: break
                }
                tempOperator = nil
            } else {
                temp = value
            }
        } else {
            tempOperator = equation[i]
        }
    }

    result = max(result, temp)
}

let equation = Array(readLine()!)
let offSet: UInt8 = 97

let array = [1, 2, 3, 4]
var standards = permutation(0, [])
var result = 0

standards.forEach { solve($0) }
print(result)