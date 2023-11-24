struct PriorityQueue<T> {
    private var elements: [T]
    private let sort: (T, T) -> Bool

    init(_ sort: @escaping (T, T) -> Bool, _ elements: [T] = []) {
        self.sort = sort
        self.elements = elements

        if !elements.isEmpty {
            for i in stride(from: (elements.count / 2) - 1, to: -1, by: -1) { siftDown(i) }
        }
    }

    var isEmpty: Bool { elements.isEmpty }
    var count: Int { elements.count }

    private func leftChildIndex(_ i: Int) -> Int { return (2 * i) + 1 }
    private func rightChildIndex(_ i: Int) -> Int { return (2 * i) + 2 }
    private func parentIndex(_ i: Int) -> Int { return (i - 1) / 2 }

    mutating func enqueue(_ node: T) {
        elements.append(node)
        siftUp(count - 1)
    }
    mutating private func siftUp(_ i: Int) {
        var child = i
        var parent = parentIndex(child)
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(child)
        }
    }

    mutating func dequeue() -> T? {
        guard !isEmpty else { return nil }
        elements.swapAt(0, count - 1)
        defer { siftDown(0) }
        return elements.removeLast()
    }

    mutating private func siftDown(_ i: Int) {
        var parent = i
        while true {
            let left = leftChildIndex(parent)
            let right = rightChildIndex(parent)
            var candidate = parent

            if left < count && sort(elements[left], elements[candidate]) { candidate = left }
            if right < count && sort(elements[right], elements[candidate]) { candidate = right }
            if candidate == parent { return }

            elements.swapAt(candidate, parent)
            parent = candidate
        }
    }
}

func solve() {
    var pq = PriorityQueue<Int>(<)
    var distance = [Int](repeating: Int.max, count: n)
    pq.enqueue(k)
    distance[k] = 0

    while let now = pq.dequeue() {
        for vertex in 0 ..< n {
            if graph[now][vertex] == Int.max || graph[now][vertex] == 0 { continue }
            
            let nowToVertex = distance[now] + graph[now][vertex]
            if nowToVertex < distance[vertex] {
                distance[vertex] = nowToVertex
                pq.enqueue(vertex)
            }
        }
    }

    var result = ""
    for dist in distance {
        if dist == Int.max { result += "-1\n" }
        else { result += "\(dist)\n" }
    }
    print(result)
}


let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (source[0], source[1])
let k = Int(readLine()!)! - 1

var graph = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)

for _ in 0 ..< m {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    graph[raw[0]][raw[1]] = raw[2] + 1
    graph[raw[1]][raw[0]] = raw[2] + 1
}

solve()