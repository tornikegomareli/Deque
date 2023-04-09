//
//  Deque+Collection.swift
//  
//
//  Created by Tornike on 10/04/2023.
//

import Foundation

extension Deque: Collection {
  public typealias Index = Int

  public var startIndex: Index {
    return storage.head
  }

  public var endIndex: Index {
    return storage.tail
  }

  public func index(after i: Index) -> Index {
    precondition(i < endIndex, "Index out of range")
    return (i + 1) % storage.capacity
  }
}
