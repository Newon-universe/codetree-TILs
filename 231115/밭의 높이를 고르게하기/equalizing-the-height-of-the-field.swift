let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, H, T) = (raw[0], raw[1], raw[2])
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = Int.max

for i in 0 ... N - T {
    var temp = 0

    for j in i ..< i + T {
        if array[j] != H { temp += abs(H - array[j]) }
    }
    result = min(temp, result)
}

print(result)