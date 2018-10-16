//
//  CurrentQoS.swift
//

import Dispatch

extension DispatchQoS
{
#if swift(>=4.1.50)
  @inlinable
  static public var current: DispatchQoS {
    guard let qosClass = DispatchQoS.QoSClass.current
      else { return .default }
    return DispatchQoS(qosClass: qosClass, relativePriority: 0)
  }
#else
  static public var current: DispatchQoS {
    @inline(__always)
    get {
      guard let qosClass = DispatchQoS.QoSClass.current
        else { return .default }
      return DispatchQoS(qosClass: qosClass, relativePriority: 0)
    }
  }
#endif
}

extension DispatchQoS.QoSClass
{
#if swift(>=4.1.50)
  @inlinable
  static public var current: DispatchQoS.QoSClass? {
#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
    return DispatchQoS.QoSClass(rawValue: qos_class_self())
#else // platforms that rely on swift-corelibs-libdispatch
    return nil
#endif
  }
#else
  static public var current: DispatchQoS.QoSClass? {
    @inline(__always)
    get {
#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
      return DispatchQoS.QoSClass(rawValue: qos_class_self())
#else // platforms that rely on swift-corelibs-libdispatch
      return nil
#endif
    }
  }
#endif
}
