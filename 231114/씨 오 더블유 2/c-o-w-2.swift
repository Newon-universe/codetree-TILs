func dfs(_ depth: Int) {
    if depth == 3 {
        result += 1
        return
    }

    for i in 0 ..< n {
        switch depth {
        case 0: if array[i] == "C" { dfs(depth + 1) }
        case 1: if array[i] == "O" { dfs(depth + 1) }
        case 2: if array[i] == "W" { dfs(depth + 1) }
        default: break
        }
    }
}


let n = Int(readLine()!)!
let array = Array(readLine()!).map { String($0) }
var result = 0

dfs(0)
print(result)