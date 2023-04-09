import XCTest
import Foundation
@testable import Deque

final class DequeTests: XCTestCase {
  func testInitialization() {
    let deque = Deque<Int>(capacity: 0)
    XCTAssertTrue(deque.isEmpty)
  }

  func testAppending() {
    var deque = Deque<Int>(capacity: 3)
    deque.append(1)
    deque.append(2)
    deque.append(3)
    XCTAssertEqual(Array(deque), [1, 2, 3])
  }

  func testPrepending() {
    var deque = Deque<Int>(capacity: 3)
    deque.prepend(1)
    deque.prepend(2)
    deque.prepend(3)
    XCTAssertEqual(Array(deque), [3, 2, 1])
  }

  func testRemovingFirst() {
    var deque = Deque<Int>(elements: [1, 2, 3])
    XCTAssertEqual(deque.removeFirst(), 1)
    XCTAssertEqual(Array(deque), [2, 3])
  }

  func testRemovingLast() {
    var deque = Deque<Int>(elements: [1, 2, 3])
    XCTAssertEqual(deque.removeLast(), 3)
    XCTAssertEqual(Array(deque), [1, 2])
  }

  func testIndexing() {
    let deque = Deque<Int>(elements: [1, 2, 3])
    XCTAssertEqual(deque[1], 2)
  }

  func testMutatingElements() {
    var deque = Deque<Int>(elements: [1, 2, 3])
    deque[1] = 4
    XCTAssertEqual(Array(deque), [1, 4, 3])
  }

  func testBidirectionalIndexing() {
    let deque = Deque<Int>(elements: [1, 2, 3])
    let index = deque.index(after: 0)
    XCTAssertEqual(index, 1)
    let beforeIndex = deque.index(before: index)
    XCTAssertEqual(beforeIndex, 0)
  }

  func testCollectionConformance() {
    let deque = Deque<Int>(elements: [1, 2, 3])
    XCTAssertEqual(Array(deque), [1, 2, 3])
  }

  func testEmptyDequeBehavior() {
    var deque = Deque<Int>(capacity: 0)
    XCTAssertNil(deque.removeFirst())
    XCTAssertNil(deque.removeLast())
  }

  func testDequeResizing() {
    var deque = Deque<Int>(capacity: 3)
    deque.append(1)
    deque.append(2)
    deque.append(3)
    deque.append(4) // This should trigger a resize
    XCTAssertEqual(Array(deque), [1, 2, 3, 4])
  }

  func testStressTest() {
    var deque = Deque<Int>(capacity: 100000)
    let largeNumber = 100_000

    for i in 1...largeNumber {
      deque.append(i)
    }

    XCTAssertEqual(deque.count, largeNumber)

    for i in 1...largeNumber {
      XCTAssertEqual(deque.removeFirst(), i)
    }
  }
}

