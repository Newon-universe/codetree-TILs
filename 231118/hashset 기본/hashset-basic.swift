let n = Int(readLine()!)!
var setter = Set<Int>()

for _ in 0 ..< n {
    let raw = readLine()!.split { $0 == " " }
    let value = Int(raw[1])!
    switch raw[0] {
    case "add": setter.insert(value)
    case "remove": setter.remove(value)
    case "find": print(setter.contains(value))
    default: break
    }
}