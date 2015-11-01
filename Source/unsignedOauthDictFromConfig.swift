import Foundation

func unsignedOauthDictFromConfig(config: Config, includeToken: Bool) -> [String: String] {
    var dict = [
        "oauth_consumer_key": config.consumerKey,
        "oauth_nonce": NSUUID().UUIDString,
        "oauth_signature_method": "HMAC-SHA1",
        "oauth_timestamp": String(Int64(NSDate().timeIntervalSince1970)),
        "oauth_version": "1.0",
    ]

    if includeToken {
        dict["oauth_token"] = config.oauthToken!
    }

    return dict
}
