from typing import Any, Self, cast


class Node:
    def __init__(self, value: Any, succeeding=None, previous=None):
        self.value = value
        self.succeeding: Self | None = succeeding
        self.previous: Self | None = previous


class LinkedList:
    def __init__(self):
        self._head: Node | None = None
        self._tail: Node | None = None
        self._size: int = 0

    def __len__(self) -> int:
        return self._size

    def _is_empty(self) -> bool:
        return self._size == 0

    def _ensure_is_not_empty(self) -> None:
        if self._is_empty():
            raise IndexError("List is empty")

    def push(self, value: Any):
        if self._is_empty():
            self._head = Node(value, succeeding=None, previous=None)
            self._tail = self._head
        else:
            old_head = cast(Node, self._head)
            self._head = Node(value, succeeding=None, previous=old_head)
            old_head.succeeding = self._head
        self._size += 1

    def unshift(self, value):
        if self._is_empty():
            self._head = Node(value, succeeding=None, previous=None)
            self._tail = self._head
        else:
            old_tail = cast(Node, self._tail)
            self._tail = Node(value, succeeding=old_tail, previous=None)
            old_tail.previous = self._tail
        self._size += 1

    def pop(self):
        self._ensure_is_not_empty()

        self._size -= 1
        old_head = cast(Node, self._head)

        self._head = old_head.previous
        if self._head:
            self._head.succeeding = None
        else:
            self._tail = None

        return old_head.value

    def shift(self):
        self._ensure_is_not_empty()

        self._size -= 1
        old_tail = cast(Node, self._tail)

        self._tail = old_tail.succeeding
        if self._tail:
            self._tail.previous = None
        else:
            self._head = None

        return old_tail.value

    def delete(self, value: Any):
        current = self._head
        while current and current.value != value:
            current = current.previous

        if current is None:
            raise ValueError("Value not found")

        if current == self._head:
            self.pop()
            return

        if current == self._tail:
            self.shift()
            return

        prev = current.previous
        succ = current.succeeding
        if prev:
            prev.succeeding = succ
        if succ:
            succ.previous = prev
        self._size -= 1
