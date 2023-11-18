readLine()!
var aSet = Set<Int>()
var bSet = Set<Int>()
var result = ""

readLine()!.split { $0 == " " }.forEach { aSet.insert(Int($0)!) }
readLine()
readLine()!.split { $0 == " " }.forEach { aSet.contains(Int($0)!) ? { result += "1 " }() : { result += "0 " }() }
print(result)