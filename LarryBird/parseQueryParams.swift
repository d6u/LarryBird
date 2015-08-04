import Foundation

func parseQueryParams(queryStr: String) -> [String: String] {
    let pairs = queryStr.componentsSeparatedByString("&")
    var dict = [String: String]()
    for pair in pairs {
        let keyValue = pair.componentsSeparatedByString("=")
        dict[keyValue[0]] = keyValue[1]
    }
    return dict
}
