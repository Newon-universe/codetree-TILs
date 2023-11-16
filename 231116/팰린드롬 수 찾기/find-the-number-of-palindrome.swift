let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
let (X, Y) = (raw[0], raw[1])
var result = 0

for number in X ... Y {
    let array = Array(String(number)).map { Int(String($0))! }
    let arrayCount = array.count
    var isPalindrome = true

    for i in 0 ..< arrayCount / 2 {
        if array[i] != array[arrayCount - 1 - i] { isPalindrome = false; break }
    }
    if isPalindrome { result += 1 }
}

print(result)