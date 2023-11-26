struct PriorityQueue<T: Equatable> {
    private var elements: [T]
    private let sort: (T, T) -> Bool

    init(_ sort: @escaping (T, T) -> Bool, _ elements: [T] = []) {
        self.sort = sort
        self.elements = elements

        if !elements.isEmpty {
            for i in stride(from: (elements.count / 2) - 1, to: -1, by: -1) { siftDown(i) }
        }
    }

    var isEmpty: Bool { return elements.isEmpty }
    var count: Int { return elements.count }

    private func leftChildIndex(_ i: Int) -> Int { return (2 * i) + 1 }
    private func rightChildIndex(_ i: Int) -> Int { return (2 * i) + 2 }
    private func parentIndex(_ i: Int) -> Int { return (i - 1) / 2 }

    mutating func enqueue(_ node: T) {
        elements.append(node)
        siftUp(count - 1)
    }

    private mutating func siftUp(_ i: Int) {
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

    private mutating func siftDown(_ i: Int) {
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

struct Node: Equatable, Comparable {
    static func < (lhs: Node, rhs: Node) -> Bool {
        return lhs.dist < rhs.dist
    }

    let vertex: Int
    let dist: Int
    init(_ vertex: Int, _ dist: Int) {
        self.vertex = vertex
        self.dist = dist
    }
}

func solve() {
    var pq = PriorityQueue<Node>(<)
    var distances = [Int: Int]()
    var visited = [Int:Bool]()

    pq.enqueue(Node(a, 0))
    for key in graph.keys {
        distances[key] = key == a ? 0 : Int.max
        visited[key] = false
    }

    while let now = pq.dequeue() {
        guard !visited[now.vertex]! else { continue }
        visited[now.vertex] = true

        for (vertex, dist) in graph[now.vertex]! {
            let newDist = now.dist + dist
            
            if newDist < distances[vertex]! {
                distances[vertex] = newDist
                pq.enqueue(Node(vertex, newDist))
            }
        }
    }

    print(distances[b] ?? -1)
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (source[0], source[1])

var graph = [Int: [Int:Int]]()
for _ in 0 ..< m {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! }
    graph[raw[0], default:[:]].merge([raw[1]: raw[2]]) { $1 }
    graph[raw[1], default:[:]].merge([raw[0]: raw[2]]) { $1 }
}

let source2 = readLine()!.split { $0 == " " }.map { Int($0)! }
let (a, b) = (source2[0], source2[1])

solve()