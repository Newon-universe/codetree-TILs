let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (aCount, bCount) = (raw[0], raw[1])
var interSection = Set<Int>()

var a = Set<Int>()
readLine()!.split { $0 == " " }.forEach { a.insert(Int($0)!) }
readLine()!.split { $0 == " " }.forEach { 
    let value = Int($0)!
    if a.contains(value) { interSection.insert(value) } 
}

print((aCount - interSection.count) + (bCount - interSection.count))