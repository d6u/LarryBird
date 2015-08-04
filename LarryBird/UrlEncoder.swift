import Foundation
import Alamofire

let UrlEncoder = Alamofire.ParameterEncoding.Custom {
    (request: URLRequestConvertible, params: [String : AnyObject]?) -> (NSMutableURLRequest, NSError?) in

    let mutableUrlRequest = request.URLRequest.mutableCopy() as! NSMutableURLRequest

    var arr = [String]()
    for (key, value) in params as! [String: String] {
        arr.append(urlEncode(key) + "=" + urlEncode(value))
    }
    let paramStr = join("&", arr)

    switch mutableUrlRequest.HTTPMethod {
    case "GET":
        let urlComponents = NSURLComponents(URL: mutableUrlRequest.URL!, resolvingAgainstBaseURL: false)!
        urlComponents.percentEncodedQuery = paramStr
        mutableUrlRequest.URL = urlComponents.URL
    case "POST":
        mutableUrlRequest.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        mutableUrlRequest.HTTPBody = paramStr.dataUsingEncoding(NSUTF8StringEncoding, allowLossyConversion: false)
    default:
        assert(false, "Only support GET and POST")
    }

    return (mutableUrlRequest, nil)
}
