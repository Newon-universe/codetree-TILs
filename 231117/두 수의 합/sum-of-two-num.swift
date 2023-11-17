let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (raw[0], raw[1])
var result = 0

var dict = [Int:Int]()
readLine()!.split { $0 == " " }.map { Int($0)! }.forEach {
    dict[$0, default: 0] += 1
}

dict.keys.forEach { key in
    if k - key == key && dict[key, default: 0] > 0 { 
        for i in 1 ..< dict[key, default: 0] {
            result += i
        }
        dict[key] = 0
    }
    else if dict[k - key, default: 0] > 0 && dict[key, default: 0] > 0 { 
        result += dict[k - key, default: 0] * dict[key, default: 0]
        dict[k - key] = 0
        dict[key] = 0
    }
}

print(result)