import Foundation
import Alamofire

public func request
    (config: Config)
    (_ endpoint: Endpoint, params: [Param], finish: (error: NSError?, data: [String: AnyObject]?) -> Void)
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
