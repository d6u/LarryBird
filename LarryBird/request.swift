import Foundation
import Alamofire

public typealias FinishClosure = (error: NSError?, data: [String: AnyObject]?) -> Void

public func request
    (config: Config)
    (_ endpoint: Endpoint, _ params: [Param], _ finish: FinishClosure)
{
    Alamofire.request(buildRequest(config, endpoint, params))
        .validate()
        .response { request, response, data, error in
            if let data = data {
                finish(error: nil, data: processResponse(data, endpoint))
            } else {
                finish(error: error, data: nil)
            }
        }
}

public func requestWebAuthUrl(config: Config)(_ callbackUrl: String, finish: (error: NSError?, url: NSURL?) -> Void) {
    request(config)(.OauthRequestToken, [.OauthCallback(callbackUrl)]) { error, data in
        let token = data?["oauth_token"] as? String
        let url = NSURL(string: "https://api.twitter.com/oauth/authenticate?oauth_token=\(token)")
        finish(error: error, url: url)
    }
}

public func requestAccessToken(config: Config)(_ oauthReturnUrl: NSURL, finish: FinishClosure) {
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
