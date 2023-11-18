let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (raw[0], raw[1])
var dict = [Int:Int]()
var result = 0

let array = readLine()!.split { $0 == " " }.map { 
    let value = Int($0)!
    dict[value, default: 0] += 1;
    return value
}

for i in 0 ..< n {
    dict[array[i], default: 0] -= 1

    for j in 0 ..< i {
        let diff = k - (array[i] + array[j])

        if let value = dict[diff] {
            result += value
        }
    }
}

print(result)