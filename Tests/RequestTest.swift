import XCTest
import Nocilla
@testable import LarryBird

class RequestTest: XCTestCase {
    
    override class func setUp() {
        super.setUp()
        LSNocilla.sharedInstance().start()
    }
    
    override class func tearDown() {
        LSNocilla.sharedInstance().stop()
        super.tearDown()
    }
    
    let config = Config(
        consumerKey: "9UWGPKIb9qvJ6QCLeh5FocLOl",
        consumerSecret: "T5wEP5b0aPoUQzMDpAgvElChw9o6OoUInQEKZ7VEbyfgm7gq0E",
        oauthToken: nil,
        oauthSecret: nil)
    
    override func tearDown() {
        LSNocilla.sharedInstance().clearStubs()
        super.tearDown()
    }
    
    func test200QueryParamFormat() {
        let expectation = expectationWithDescription("Request finished in 1sec")
        
        stubRequest("POST", "https://api.twitter.com/oauth/request_token")
            .andReturn(200)
            .withBody("a=123&b=456")
        
        request(config, .OauthRequestToken, [.OauthCallback("http://avetuc.daiwei.lu")]) { error, data in
            XCTAssertNil(error)
            XCTAssertEqual(data as! [String:String], ["a": "123", "b": "456"], "should query params as dictionary")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1, handler: nil)
    }
    
    func test401JSONFormat() {
        let expectation = expectationWithDescription("Request finished in 1sec")
        
        stubRequest("POST", "https://api.twitter.com/oauth/request_token")
            .andReturn(401)
            .withBody("{\"errors\":[{\"code\":32,\"message\":\"Could not authenticate you.\"}]}")
        
        request(config, .OauthRequestToken, [.OauthCallback("http://avetuc.daiwei.lu")]) { error, data in
            XCTAssertNotNil(error)
            let dict = data as? [String: Array<[String: NSObject]>]
            XCTAssertNotNil(dict)
            if let dict = dict {
                XCTAssertEqual(Array(dict.keys), ["errors"])
                XCTAssertEqual(dict["errors"]!.count, 1)
                XCTAssertEqual(dict["errors"]![0], ["code": 32, "message": "Could not authenticate you."])
            }
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1, handler: nil)
    }
}
