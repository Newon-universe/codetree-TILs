var dict = [Character:Int]()
let raw = Array(readLine()!)

for c in raw {
    dict[c, default: 0] += 1
}

let result = dict.sorted { if $0.value == $1.value { return $0.key < $1.key } else { return $0.value < $1.value } }
if result[0].value > 1 { print("None") } else { print(result[0].key) }