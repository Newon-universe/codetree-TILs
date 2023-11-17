let n = Int(readLine()!)!
var dict = [Int:Int]()

for _ in 0 ..< n {
    let order = readLine()!.split { $0 == " " }
    
    switch order[0] {
    case "add": dict[Int(order[1])!] = Int(order[2])!
    case "remove": dict[Int(order[1])!] = nil
    case "find": if let value = dict[Int(order[1])!] { print(value) } else { print("None") }
    default: break
    }
}