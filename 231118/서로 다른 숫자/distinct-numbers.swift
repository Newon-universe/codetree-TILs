var setter = Set<Int>()
readLine()!
readLine()!.split { $0 == " " }.forEach { setter.insert(Int($0)!) }
print(setter.count)