//
//  DictionaryFromParamsTests.swift
//  LarryBird
//
//  Created by Daiwei Lu on 11/1/15.
//  Copyright © 2015 Daiwei Lu. All rights reserved.
//

import XCTest
@testable import LarryBird

class DictionaryFromParamsTests: XCTestCase {
    
    func testReturnValue() {
        let r1 = dictionaryFromParams([])
        XCTAssertEqual(r1, [String:String](), "should return empty dictionary")
        
        let r2 = dictionaryFromParams([.Count(100), .ScreenName("the_name")])
        XCTAssertEqual(r2, ["count": "100", "screen_name": "the_name"], "should return populated dictionary")
    }

}
