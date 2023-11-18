let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (raw[0], raw[1])
var dict = [Int:Int]()
var result = ""

readLine()!.split { $0 == " " }.forEach { dict[Int($0)!, default: 0] += 1 }

dict
.sorted { 
    if $0.value == $1.value { return $0.key > $1.key }
    else { return $0.value > $1.value }
}
.map { $0.key }[0 ..< k]
.forEach { result += "\($0) " }

print(result)