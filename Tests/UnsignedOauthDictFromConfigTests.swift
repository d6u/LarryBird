//
//  UnsignedOauthDictTests.swift
//  LarryBird
//
//  Created by Daiwei Lu on 11/1/15.
//  Copyright © 2015 Daiwei Lu. All rights reserved.
//

import XCTest
@testable import LarryBird

class UnsignedOauthDictFromConfigTests: XCTestCase {
    
    func testDictDoesNotIncludeToken() {
        let config = Config(consumerKey: "a", consumerSecret: "b", oauthToken: nil, oauthSecret: nil)
        let r = unsignedOauthDictFromConfig(config, includeToken: false)
        XCTAssertEqual(r["oauth_consumer_key"], config.consumerKey, "should include provided consumer key")
        XCTAssertNotNil(r["oauth_nonce"], "should contain desired key")
        XCTAssertNotNil(r["oauth_signature_method"], "should contain desired key")
        XCTAssertNotNil(r["oauth_timestamp"], "should contain desired key")
        XCTAssertNotNil(r["oauth_version"], "should contain desired key")
        XCTAssertEqual(r.keys.count, 5, "should contain no other key")
    }
    
    func testDictIncludesToken() {
        let config = Config(consumerKey: "a", consumerSecret: "b", oauthToken: "c", oauthSecret: nil)
        let r = unsignedOauthDictFromConfig(config, includeToken: true)
        XCTAssertEqual(r["oauth_consumer_key"], config.consumerKey, "should include provided consumer key")
        XCTAssertEqual(r["oauth_token"], config.oauthToken!, "should include provided oauth token")
        XCTAssertNotNil(r["oauth_nonce"], "should contain desired key")
        XCTAssertNotNil(r["oauth_signature_method"], "should contain desired key")
        XCTAssertNotNil(r["oauth_timestamp"], "should contain desired key")
        XCTAssertNotNil(r["oauth_version"], "should contain desired key")
        XCTAssertEqual(r.keys.count, 6, "should contain no other key")
    }
    
}
