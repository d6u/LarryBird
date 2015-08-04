import Foundation

internal func merge(left: [String: String], right: [String: String]) -> [String: String] {
    var target = left
    for (k, v) in right {
        target.updateValue(v, forKey: k)
    }
    return target
}
