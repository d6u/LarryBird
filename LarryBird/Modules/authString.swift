import Foundation

func authString(config: Config, endpoint: Endpoint, params: [String: String]) -> String {
    var oauthDict = unsignedOauthDict(config, params, endpoint.includeToken)
    let allParams = merge(oauthDict, params)

    var signingKey = urlEncode(config.consumerSecret) + "&"
    if endpoint.includeToken {
        signingKey += urlEncode(config.oauthSecret!)
    }

    oauthDict["oauth_signature"] = generateOauthSignature(endpoint.method, endpoint.url, allParams, signingKey)

    var arr = [String]()
    for key in sorted(oauthDict.keys) {
        let value = oauthDict[key]!
        arr.append(urlEncode(key) + "=\"" + urlEncode(value) + "\"")
    }

    return "OAuth " + join(", ", arr)
}
