import Foundation

private let charactersToLeaveUnescaped = "[]."

func urlEncode(str: String) -> String {
    return str.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet(charactersInString: charactersToLeaveUnescaped))!
}
