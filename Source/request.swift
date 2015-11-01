import Foundation
import Alamofire

public typealias FinishClosure = (error: NSError?, data: AnyObject?) -> Void

//public func request(config: Config)(_ endpoint: Endpoint, _ params: [Param], _ finish: FinishClosure) {
//    request(config, endpoint, params, finish)
//}

public func request(config: Config, _ endpoint: Endpoint, _ params: [Param], _ finish: FinishClosure) {
    Alamofire.request(buildRequest(config, endpoint, params))
        .validate()
        .response { request, response, data, error in
            if let data = data {
                finish(error: nil, data: processResponse(data, endpoint: endpoint))
            } else {
                finish(error: error, data: nil)
            }
        }
}
