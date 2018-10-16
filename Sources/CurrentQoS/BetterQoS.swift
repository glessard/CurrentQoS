//
//  BetterQoS.swift
//

import Dispatch

extension DispatchQoS
{
  public func isBetterThan(_ other: DispatchQoS) -> Bool
  {
    let lp = self.relativePriority
    if lp < -15 || lp > 0 { return false }
    let rp = other.relativePriority
    if rp < -15 || rp > 0 { return true }

    let lq = self.qosClass
    let rq = other.qosClass
    if lq == rq { return lp < rp }
    return lq.isBetterThan(rq)
  }
}

extension DispatchQoS.QoSClass
{
  public func isBetterThan(_ other: DispatchQoS.QoSClass) -> Bool
  {
    switch (self, other)
    {
    case (.unspecified, _): return false
    case (_, .unspecified): return true
    case (.userInteractive, .userInteractive): return false
    case (.userInteractive, _): return true
    case (.userInitiated, .userInteractive): return false
    case (.userInitiated, .userInitiated): return false
    case (.userInitiated, _): return true
    case (.default, .background): return true
    case (.default, .utility): return true
    case (.utility, .background): return true
    default: return false
    }
  }
}
