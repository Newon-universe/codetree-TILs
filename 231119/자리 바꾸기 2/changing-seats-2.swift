let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (raw[0], raw[1])

var array = Array(0 ..< n)
var action = [() -> Void]()
var setter = [Set<Int>](repeating: Set<Int>(), count: n)
var result = ""

for i in 0 ..< n {
    setter[i].insert(i)
}

for i in 0 ..< k {
    let position = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    let a = position[0]
    let b = position[1]
    
    let act = {
        (array[a], array[b]) = (array[b], array[a])
        setter[array[a]].insert(a)
        setter[array[b]].insert(b)
    }
    action.append(act)
    act()
}

for i in 0 ..< 2 * k {
    action[i % k]()
}

setter.forEach {
    result += "\($0.count)\n"
}

print(result)