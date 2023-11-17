let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (raw[0], raw[1])
var stringDict = [String:Int]()
var numberDict = [Int:String]()
var result = ""

for i in 1 ... n {
    let input = readLine()!
    stringDict[input] = i
    numberDict[i] = input
}

for _ in 0 ..< m {
    let input = readLine()!

    if let key = Int(input) {
        result += "\(numberDict[key]!)\n"
    } else {
        result += "\(stringDict[input]!)\n"
    }
}

print(result)