import XCTest
import Dispatch

import CurrentQoS

final class CurrentQoSTestCase: XCTestCase
{
  func testCurrent()
  {
    let requested = DispatchQoS(qosClass: .userInitiated, relativePriority: -1)
    let q = DispatchQueue(label: "", qos: requested)

    let e = expectation(description: #function)
    q.async {
#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
      let current = DispatchQoS.current
      XCTAssert(current.qosClass == requested.qosClass)
      XCTAssert(current.relativePriority == 0) // can't get relative priority without knowing the queue
#endif

#if swift(>=5.0) || os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
      XCTAssert(q.qos == requested)
#endif
      e.fulfill()
    }

    waitForExpectations(timeout: 0.1)
  }
}

final class BetterQoSTestCase: XCTestCase
{
  func testQoSClass()
  {
    let classes: [DispatchQoS.QoSClass] = [.unspecified, .background, .utility, .default, .userInitiated, .userInteractive]

    for (le,lq) in classes.enumerated()
    {
      for (re,rq) in classes.enumerated()
      {
#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
        XCTAssertEqual(lq.isBetterThan(rq), lq.rawValue.rawValue > rq.rawValue.rawValue)
#endif
        XCTAssertEqual(lq.isBetterThan(rq), le > re)
      }
    }
  }

  func testQoS()
  {
    var q1 = DispatchQoS(qosClass: .default, relativePriority: 1)
    var q2 = DispatchQoS.background
    XCTAssertFalse(q1.isBetterThan(q2))

    q1 = DispatchQoS(qosClass: .default, relativePriority: -5)
    q2 = .default
    XCTAssert(q1.isBetterThan(q2))

    q1 = .utility
    q2 = DispatchQoS(qosClass: .utility, relativePriority: -1)
    XCTAssertFalse(q1.isBetterThan(q2))

    q2 = DispatchQoS(qosClass: .userInteractive, relativePriority: -100)
    XCTAssert(q1.isBetterThan(q2))

    q2 = .userInitiated
    XCTAssertFalse(q1.isBetterThan(q2))
  }
}
