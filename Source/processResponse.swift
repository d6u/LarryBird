import Foundation

func processResponse(data: NSData, endpoint: Endpoint) -> AnyObject {
    switch endpoint.responseFormat {
    case .QueryParam:
        let json = parseQueryParams(NSString(data: data, encoding: NSUTF8StringEncoding) as! String)
        return json
    case .JSON:
        let json: AnyObject? = try? NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
        return json!
    }
}
