import Foundation

func paramsToDict(params: [Param]) -> [String: String] {
    var dict = [String: String]()
    for param in params {
        let pair = param.pair
        dict[pair.key] = pair.value
    }
    return dict
}
