import Foundation

private let charactersToBeEscaped = ":/?&=;+!@#$()',*" as CFStringRef
private let charactersToLeaveUnescaped = "[]." as CFStringRef

func urlEncode(str: String) -> String {
    return CFURLCreateStringByAddingPercentEscapes(
        kCFAllocatorDefault,
        str as CFString,
        charactersToLeaveUnescaped,
        charactersToBeEscaped,
        CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding)
    ) as String
}
