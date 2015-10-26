import Foundation

func authString(config: Config, _ endpoint: Endpoint, _ params: [String: String]) -> String {
    var oauthDict = unsignedOauthDict(config, params: params, includeToken: endpoint.includeToken)
    let allParams = merge(oauthDict, right: params)

    var signingKey = urlEncode(config.consumerSecret) + "&"
    if endpoint.includeToken {
        signingKey += urlEncode(config.oauthSecret!)
    }

    oauthDict["oauth_signature"] = generateOauthSignature(endpoint.method, url: endpoint.url, params: allParams, signingKey: signingKey)

    var arr = [String]()
    for key in oauthDict.keys.sort() {
        let value = oauthDict[key]!
        arr.append(urlEncode(key) + "=\"" + urlEncode(value) + "\"")
    }

    return "OAuth " + arr.joinWithSeparator(", ")
}
