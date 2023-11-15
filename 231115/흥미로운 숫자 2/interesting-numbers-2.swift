let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (X, Y) = (raw[0], raw[1])
var result = 0

for number in X ... Y {
    let value = Array(String(number))
    guard !value.allSatisfy({ $0 == value[0] }) else { continue }

    var check = [Character : Int]()
    for element in value {
        check[element, default: 0] += 1
    }
    
    if check.count == 2 && check.values.filter { $0 == 1 }.count == 1 { result += 1 }
}

print(result)