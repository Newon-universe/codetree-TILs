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

struct Node: Equatable {
    var vertex: Int
    var dist: Int
    init(_ vertex: Int, _ dist: Int) {
        self.vertex = vertex
        self.dist = dist
    }
}

func solve() {
    var pq = PriorityQueue<Node>({ $0.dist < $1.dist })
    var distance = [Int: Int]()
    var visited = [Int: Bool]()
    
    pq.enqueue(Node(k, 0))
    for key in graph.keys {
        let value = key == k ? 0 : Int.max
        distance.updateValue(value, forKey: key)
        visited[key] = false
    }

    while let now = pq.dequeue() {
        guard !visited[now.vertex]! else { continue }
        visited[now.vertex]! = true
        if distance[now.vertex]! < now.dist { continue }
        
        for (vertex, dist) in graph[now.vertex]! {            
            let newDist = now.dist + dist
            if newDist < distance[vertex]! {
                distance[vertex] = newDist
                pq.enqueue(Node(vertex, newDist))
            }
        }
    }

    var result = ""
    for i in 0 ..< n {
        let dist = distance[i, default: Int.max]
        if dist == Int.max { result += "-1\n" }
        else { result += "\(dist)\n" }
    }
    print(result)
}

let source = readLine()!.split { $0 == " " }.map { Int($0)! }
let (n, m) = (source[0], source[1])
let k = Int(readLine()!)! - 1

var graph = [Int: [Int:Int]]()

for _ in 0 ..< m {
    let raw = readLine()!.split { $0 == " " }.map { Int($0)! - 1 }
    graph[raw[0], default: [:]].merge([raw[1]: raw[2] + 1]) { $1 }
    graph[raw[1], default: [:]].merge([raw[0]: raw[2] + 1]) { $1 }
}

solve()