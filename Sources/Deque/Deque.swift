//  Deque.swift
//  Created by Tornike on 10/04/2023.

import Foundation

public struct Deque<Element> {
  var storage: CircularBuffer<Element>

  public init(capacity: Int = 0) {
    storage = CircularBuffer(capacity: capacity )
  }

  public init(elements: [Element]) {
    let requiredCapacity = elements.count
    self.init(capacity: requiredCapacity)

    for element in elements {
      self.append(element)
    }
  }
}

extension Deque {
  public mutating func prepend(_ element: Element) {
    storage.prepend(element)
  }

  public mutating func append(_ element: Element) {
    storage.append(element)
  }

  @discardableResult
  public mutating func removeFirst() -> Element? {
    return storage.removeFirst()
  }

  @discardableResult
  public mutating func removeLast() -> Element? {
    return storage.removeLast()
  }
}
