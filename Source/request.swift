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
            if let error = error {
                finish(error: error, data: processErrorResponse(data!))
            } else {
                finish(error: nil, data: processResponse(data!, endpoint: endpoint))
            }
        }
}
