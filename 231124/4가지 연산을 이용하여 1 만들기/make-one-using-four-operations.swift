struct Queue<T> {
    private var input = [T]()
    private var output = [T]()

    var isEmpty: Bool {
        input.isEmpty && output.isEmpty
    }
    mutating func enqueue(_ node: T) {
        input.append(node)
    }
    mutating func dequeue() -> T {
        if output.isEmpty {
            output = input.reversed()
            input.removeAll()
        }
        return output.removeLast()
    }
}

struct Node {
    var value: Int
    var step: Int
    init(_ value: Int, _ step: Int) {
        self.value = value
        self.step = step
    }
}

func solve() -> Int {
    var queue = Queue<Node>()
    var visited = [Bool](repeating: false, count: 1000001)
    queue.enqueue(Node(n, 0))

    while !queue.isEmpty {
        let now = queue.dequeue()

        for oper in [-1, 1, 2, 3] {
            var next = Node(now.value, now.step + 1)

            switch oper {
            case -1: next.value += oper
            case 1: next.value += oper
            case 2: if next.value % oper == 0 { next.value /= 2 } else { continue }
            case 3: if next.value % oper == 0 { next.value /= 3 } else { continue }
            default: break
            }

            guard !visited[next.value] else { continue }
            if next.value == 1 { return next.step }

            queue.enqueue(next)
            visited[next.value] = true
        }
    }

    return Int.max
}

let n = Int(readLine()!)!
print(solve())