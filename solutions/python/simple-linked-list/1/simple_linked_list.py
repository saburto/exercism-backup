class EmptyListException(Exception):
    def __init__(self) -> None:
        super().__init__("The list is empty.")


class Node:
    def __init__(self, value):
        self._value = value
        self._next: Node | None = None

    def value(self):
        return self._value

    def next(self):
        return self._next


class LinkedList:
    def __init__(self, values=None):
        self._length = 0
        self._head: Node | None = None
        if values:
            for v in values:
                self.push(v)

    def __iter__(self):
        current = self._head
        while current:
            yield current.value()
            current = current.next()

    def __len__(self):
        return self._length

    def head(self):
        if self._head is None:
            raise EmptyListException()

        return self._head

    def push(self, value):
        new_node = Node(value)
        new_node._next = self._head
        self._head = new_node
        self._length += 1

    def pop(self):
        if self._head is None:
            raise EmptyListException()

        old_head = self._head
        self._head = old_head.next()
        self._length -= 1

        return old_head.value()

    def reversed(self):
        new_linked_list = LinkedList()
        current = self._head
        while current:
            new_linked_list.push(current.value())
            current = current.next()
        return new_linked_list
