import Foundation

func processResponse(data: NSData, endpoint: Endpoint) -> AnyObject {
    switch endpoint.responseFormat {
    case .QueryParam:
        return parseQueryParams(NSString(data: data, encoding: NSUTF8StringEncoding) as! String)
    case .JSON:
        return try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
    }
}

func processErrorResponse(data: NSData) -> AnyObject {
    return try! NSJSONSerialization.JSONObjectWithData(data, options: .MutableContainers)
}
