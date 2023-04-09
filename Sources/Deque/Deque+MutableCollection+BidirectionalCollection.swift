//  Deque+MutableCollection+BidirectionalCollection.swift
//  Created by Tornike on 10/04/2023.
//

import Foundation

extension Deque: MutableCollection, BidirectionalCollection {
  public subscript(position: Int) -> Element {
    get {
      precondition(position >= startIndex && position < endIndex, "Index out of range")
      return storage.storage[position % storage.capacity]!
    }
    set {
      precondition(position >= startIndex && position < endIndex, "Index out of range")
      storage.storage[position % storage.capacity] = newValue
    }
  }

  public func index(before i: Index) -> Index {
    precondition(i > startIndex, "Index out of range")
    return (i - 1 + storage.capacity) % storage.capacity
  }
}
