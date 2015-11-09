import Foundation

func dictionaryFromParams(params: [Param]) -> [String: String] {
    var dict = [String: String]()
    for param in params {
        let (key, value) = param.pair
        dict[key] = value
    }
    return dict
}
