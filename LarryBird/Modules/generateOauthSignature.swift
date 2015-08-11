import Foundation

func generateOauthSignature(method: String, url: String, params: [String: String], signingKey: String) -> String {
    var arr = [String]()
    for key in sorted(params.keys) {
        let value = params[key]!
        arr.append(urlEncode(key) + "=" + urlEncode(value))
    }
    let paramStr = join("&", arr)
    let baseStr = method + "&" + urlEncode(url) + "&" + urlEncode(paramStr)
    return sha1DigestString(baseStr, signingKey)
}
