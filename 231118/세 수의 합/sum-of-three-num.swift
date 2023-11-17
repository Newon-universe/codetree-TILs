let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, k) = (raw[0], raw[1])
var dict = [Int:Int]()
var result = 0

readLine()!.split { $0 == " " }.forEach { dict[Int($0)!, default: 0] += 1 }

for key in dict.keys {
    var temp = 0
    let value = dict[key, default: 0]
    let k = k - value

    for secondKey in dict.keys {
        if key == secondKey { continue }

        if k - secondKey == secondKey && dict[secondKey, default: 0] > 0 {
            for i in 1 ..< dict[secondKey, default: 0] {
                temp += 1
            }
            dict[secondKey] = 0
        } else if dict[k - secondKey,default: 0] > 0 && dict[secondKey, default: 0] > 0 {
            temp += dict[k - secondKey, default: 0] * dict[secondKey, default: 0]
            dict[k - secondKey] = 0
            dict[secondKey] = 0
        }
    }
    
    result = max(result, temp)
}

print(result)