//
//  DequePerformanceTests.swift
//  
//
//  Created by Tornike on 10/04/2023.
//

import Foundation
import XCTest
@testable import Deque

class DequePerformanceTests: XCTestCase {
  func testAppendPerformance() {
    let largeArray = Array(0..<1000000)
    measure {
      var deque = Deque<Int>()
      for element in largeArray {
        deque.append(element)
      }
    }
  }

  func testPrependPerformance() {
    let largeArray = Array(0..<1000000)
    measure {
      var deque = Deque<Int>()
      for element in largeArray {
        deque.prepend(element)
      }
    }
  }

  func testRemoveFirstPerformance() {
    var deque = Deque<Int>()
    for i in 0..<1000000 {
      deque.append(i)
    }
    measure {
      while !deque.isEmpty {
        _ = deque.removeFirst()
      }
    }
  }

  func testRemoveLastPerformance() {
    var deque = Deque<Int>()
    for i in 0..<1000000 {
      deque.append(i)
    }
    measure {
      while !deque.isEmpty {
        _ = deque.removeLast()
      }
    }
  }
}
