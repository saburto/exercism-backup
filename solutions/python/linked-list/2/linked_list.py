from typing import TypeVar, Self, cast

T = TypeVar("T")


class Node[T]:
    def __init__(self, value: T, succeeding=None, previous=None):
        self.value = value
        self.succeeding: Self | None = None
        self.previous: Self | None = None
        self.add_new_previous(previous)
        self.add_new_succesing(succeeding)

    def add_new_previous(self, new_previous: Self | None):
        if new_previous is None:
            return

        self.previous = new_previous
        new_previous.succeeding = self

    def add_new_succesing(self, new_successing: Self | None):
        if new_successing is None:
            return

        self.succeeding = new_successing
        new_successing.previous = self

    def return_next_tail(self) -> Self | None:
        new_tail = self.succeeding
        if new_tail:
            new_tail.previous = None
        return new_tail

    def return_previous_head(self) -> Self | None:
        new_head = self.previous
        if new_head:
            new_head.succeeding = None
        return new_head

    def autoremove(self) -> None:
        prev = self.previous
        succ = self.succeeding
        if prev:
            prev.succeeding = succ
        if succ:
            succ.previous = prev


class LinkedList[T]:
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

    def _set_head(self, new_head: Node | None):
        if new_head is None:
            self._head = None
            self._tail = None
            return

        self._head = new_head
        if self._tail is None:
            self._tail = new_head

    def _find_value(self, value: T) -> Node[T]:
        current = self._head
        while current and current.value != value:
            current = current.previous

        if current is None:
            raise ValueError("Value not found")

        return current

    def _set_tail(self, new_tail: Node | None):
        if new_tail is None:
            self._head = None
            self._tail = None
            return

        self._tail = new_tail
        if self._head is None:
            self._head = new_tail

    def push(self, value: T) -> None:
        new_node = Node(value, previous=self._head)
        self._size += 1
        self._set_head(new_node)

    def unshift(self, value: T) -> None:
        new_node = Node(value, succeeding=self._tail)
        self._size += 1
        self._set_tail(new_node)

    def pop(self) -> T:
        self._ensure_is_not_empty()

        self._size -= 1
        old_head = cast(Node, self._head)
        self._set_head(old_head.return_previous_head())

        return old_head.value

    def shift(self) -> T:
        self._ensure_is_not_empty()

        self._size -= 1
        old_tail = cast(Node, self._tail)
        self._set_tail(old_tail.return_next_tail())

        return old_tail.value

    def delete(self, value: T) -> None:
        current = self._find_value(value)

        if current == self._head:
            self.pop()
            return

        if current == self._tail:
            self.shift()
            return

        current.autoremove()
        self._size -= 1
