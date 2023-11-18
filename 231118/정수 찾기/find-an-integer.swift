var setter = Set<Int>()
var result = ""

readLine()
readLine()!.split { $0 == " " }.forEach { setter.insert(Int($0)!) }
readLine()
readLine()!.split { $0 == " " }.forEach { setter.contains(Int($0)!) ? { result += "1\n" }() : { result += "0\n" }() }
print(result)