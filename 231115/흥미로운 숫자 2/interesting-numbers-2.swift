let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (X, Y) = (raw[0], raw[1])
var result = 0

for number in X ... Y {
    let value = Array(String(number))
    var check = Set<Character>()
    for element in value { check.insert(element) }
    
    if check.count == 2 { result += 1 }
}

print(result)