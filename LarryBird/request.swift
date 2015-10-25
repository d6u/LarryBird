import Foundation
import Alamofire

public typealias FinishClosure = (error: NSError?, data: AnyObject?) -> Void
public typealias UrlFinishClosure = (error: NSError?, response: (data: [String: String], url: NSURL)?) -> Void

public func request(config: Config)(_ endpoint: Endpoint, _ params: [Param], _ finish: FinishClosure) {
    Alamofire.request(buildRequest(config, endpoint: endpoint, params: params))
        .validate()
        .response { request, response, data, error in
            if let data = data {
                finish(error: nil, data: processResponse(data, endpoint: endpoint))
            } else {
                finish(error: error, data: nil)
            }
        }
}

public func requestWebAuthUrl
    (config: Config)
    (_ callbackUrl: String, _ finish: UrlFinishClosure)
{
    request(config)(.OauthRequestToken, [.OauthCallback(callbackUrl)]) { error, data in
        let dict = data as? [String: String]
        if let token: String = dict?["oauth_token"] {
            let url = NSURL(string: "https://api.twitter.com/oauth/authenticate?oauth_token=\(token)")!
            finish(error: error, response: (data: dict!, url: url))
        } else {
            finish(error: error, response: nil)
        }
    }
}

public func requestAccessToken
    (config: Config)
    (_ oauthReturnUrl: NSURL, _ finish: FinishClosure)
{
    let dict = parseQueryParams(oauthReturnUrl.query!)

    if let verifier = dict["oauth_verifier"] where dict["oauth_token"] != nil {
        request(config)(.OauthAccessToken, [.OauthVerifier(verifier)], finish)
    } else {
        let error = NSError(
            domain: "com.daiweilu.LarryBird",
            code: 0,
            userInfo: [
                "description": "OAuth return does not contain any verifier",
                "provided_url": oauthReturnUrl.URLString
            ])
        finish(error: error, data: nil)
    }
}
