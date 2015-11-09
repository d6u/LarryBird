import XCTest
import Nocilla
@testable import LarryBird

class RequestTest: XCTestCase {
    
    let config = Config(
        consumerKey: "9UWGPKIb9qvJ6QCLeh5FocLOl",
        consumerSecret: "T5wEP5b0aPoUQzMDpAgvElChw9o6OoUInQEKZ7VEbyfgm7gq0E",
        oauthToken: nil,
        oauthSecret: nil)
    
    override func setUp() {
        super.setUp()
        LSNocilla.sharedInstance().start()
    }
    
    override func tearDown() {
        LSNocilla.sharedInstance().clearStubs()
        LSNocilla.sharedInstance().stop()
        super.tearDown()
    }
    
    func testExample() {
        let expectation = expectationWithDescription("Request finished in 1sec")
        
        stubRequest("POST", "https://api.twitter.com/oauth/request_token").andReturn(200).withBody("a=123&b=456")
        
        request(config, .OauthRequestToken, [.OauthCallback("http://avetuc.daiwei.lu")]) { error, data in
            XCTAssertNil(error)
            XCTAssertEqual(data as! [String:String], ["a": "123", "b": "456"], "should have expected data")
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1, handler: nil)
    }
}
