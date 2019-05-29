//
//  CurrentQoS.swift
//

import Dispatch

extension DispatchQoS
{
  @inlinable
  static public var current: DispatchQoS {
    guard let qosClass = DispatchQoS.QoSClass.current
      else { return .default }
    return DispatchQoS(qosClass: qosClass, relativePriority: 0)
  }
}

extension DispatchQoS.QoSClass
{
  @inlinable
  static public var current: DispatchQoS.QoSClass? {
#if os(macOS) || os(iOS) || os(tvOS) || os(watchOS)
    return DispatchQoS.QoSClass(rawValue: qos_class_self())
#else // platforms that rely on swift-corelibs-libdispatch
    return nil
#endif
  }
}
