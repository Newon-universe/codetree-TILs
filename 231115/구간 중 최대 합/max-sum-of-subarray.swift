let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (N, K) = (raw[0], raw[1])
let array = readLine()!.split { $0 == " " }.map { Int($0)! }
var result = 0

for i in 0 ... N - K {
    result = max(array[i ..< i + K].reduce(0, +), result)
}

print(result)