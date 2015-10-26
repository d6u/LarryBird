import Foundation

func generateOauthSignature(method: String, url: String, params: [String: String], signingKey: String) -> String {
    var arr = [String]()
    for key in params.keys.sort() {
        let value = params[key]!
        arr.append(urlEncode(key) + "=" + urlEncode(value))
    }
    let paramStr = arr.joinWithSeparator("&")
    let baseStr = method + "&" + urlEncode(url) + "&" + urlEncode(paramStr)
    return sha1DigestString(baseStr, key: signingKey)
}
