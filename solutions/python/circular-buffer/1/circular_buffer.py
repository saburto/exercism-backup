class BufferFullException(BufferError):
    """Exception raised when CircularBuffer is full.

    message: explanation of the error.

    """

    def __init__(self, message):
        self.message = message


class BufferEmptyException(BufferError):
    """Exception raised when CircularBuffer is empty.

    message: explanation of the error.

    """

    def __init__(self, message: str):
        self.message = message


class CircularBuffer:
    def __init__(self, capacity: int):
        self._capacity: int = capacity
        self._size: int = 0
        self._oldest_index: int = 0
        self._new_index: int = 0
        self._buffer = [None] * capacity

    def _increment(self, index: int) -> int:
        return (index + 1) % self._capacity

    def read(self):
        if self._size == 0:
            raise BufferEmptyException("Circular buffer is empty")

        self._size -= 1
        current_oldest = self._oldest_index
        self._oldest_index = self._increment(self._oldest_index)

        return self._buffer[current_oldest]

    def write(self, data) -> None:
        if self._size == self._capacity:
            raise BufferFullException("Circular buffer is full")

        self._buffer[self._new_index] = data
        self._new_index = self._increment(self._new_index)
        self._size += 1

    def overwrite(self, data) -> None:
        if self._size == self._capacity:
            self.read()
        self.write(data)

    def clear(self) -> None:
        self._size = 0
        self._oldest_index = 0
        self._new_index = 0
