import java.util.ArrayDeque

fun main() {
    var root = initializeTree()
    val queue = ArrayDeque<Node>()

    queue.add(root)

    while(!queue.isEmpty()) {
        val levelSize = queue.size
        val currentLevel = mutableListOf<Int>()

        for (i in 0 until levelSize) {
            val currentNode = queue.poll()
            currentLevel.add(currentNode.data)
            currentNode.leftChild?.let { queue.add(it) }
            currentNode.rightChild?.let { queue.add(it) }
        }

        println(currentLevel.joinToString(" "))
    }
}

fun initializeTree(): Node {
    var root = Node(1)
    var leftChild = Node(2)
    var rightChild = Node(3)

    root.leftChild = leftChild
    root.rightChild = rightChild

    leftChild.leftChild = Node(4)

    rightChild.leftChild = Node(5)
    rightChild.rightChild = Node(6)

    return root
}