//  CircularBuffer.swift
//  Created by Tornike on 10/04/2023.

import Foundation

public struct CircularBuffer<Element> {
  var storage: [Element?]

  var capacity: Int
  var head: Int
  var tail: Int

  public init(capacity: Int) {
    self.capacity = capacity
    self.storage = Array<Element?>(repeating: nil, count: capacity)
    self.head = 0
    self.tail = 0
  }

  private func increment(_ index: Int) -> Int {
    return (index + 1) % storage.count
  }

  private func decrement(_ index: Int) -> Int {
    return (index - 1 + storage.count) % storage.count
  }

  public mutating func prepend(_ element: Element) {
    if capacity == 0 {
      resize()
    }

    head = decrement(head)
    storage[head] = element
    if head == tail {
      resize()
    }
  }

  public mutating func append(_ element: Element) {
    if capacity == 0 {
      resize()
    }

    storage[tail] = element
    tail = increment(tail)
    if head == tail {
      resize()
    }
  }

  @discardableResult
  public mutating func removeFirst() -> Element? {
    if storage.count == 0 {
      return nil
    }

    guard let first = storage[head] else {
      return nil
    }
    storage[head] = nil
    head = increment(head)
    return first
  }

  @discardableResult
  public mutating func removeLast() -> Element? {
    if storage.count == 0 {
      return nil
    }

    guard let last = storage[decrement(tail)] else { return nil }
    tail = decrement(tail)
    storage[tail] = nil
    return last
  }

  private mutating func resize() {
    let newCapacity = max(storage.count * 2, 1)
    var newStorage = Array<Element?>(repeating: nil, count: newCapacity)
    var index = head

    for i in 0..<capacity {
      newStorage[i] = storage[index]
      index = increment(index)
    }

    storage = newStorage
    capacity = newCapacity
    head = 0
    tail = capacity / 2
  }
}
