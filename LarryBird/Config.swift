import Foundation

public struct Config {
    let consumerKey: String
    let consumerSecret: String
    let oauthToken: String?
    let oauthSecret: String?

    public init(consumerKey: String, consumerSecret: String, oauthToken: String?, oauthSecret: String?) {
        self.consumerKey = consumerKey
        self.consumerSecret = consumerSecret
        self.oauthToken = oauthToken
        self.oauthSecret = oauthSecret
    }
}
