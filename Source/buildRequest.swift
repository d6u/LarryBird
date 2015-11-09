import Foundation
import Alamofire

func buildRequest(config: Config, _ endpoint: Endpoint, _ params: [Param]) -> URLRequestConvertible {
    let url = NSURL(string: endpoint.url)!
    let mutableUrlRequest = NSMutableURLRequest(URL: url)
    mutableUrlRequest.HTTPMethod = endpoint.method

    let paramDict = dictionaryFromParams(params)
    
    let authStr = authString(config, endpoint, paramDict)
    mutableUrlRequest.setValue(authStr, forHTTPHeaderField: "Authorization")

    return UrlEncoder.encode(mutableUrlRequest, parameters: paramDict).0
}
