import Foundation
import Alamofire

func buildRequest(config: Config, endpoint: Endpoint, params: [Param]) -> URLRequestConvertible {
    let url = NSURL(string: endpoint.url)!
    let mutableUrlRequest = NSMutableURLRequest(URL: url)
    mutableUrlRequest.HTTPMethod = endpoint.method

    let paramDict = paramsToDict(params)
    let authStr = authString(config, endpoint: endpoint, params: paramDict)
    mutableUrlRequest.setValue(authStr, forHTTPHeaderField: "Authorization")

    return UrlEncoder.encode(mutableUrlRequest, parameters: paramDict).0
}
