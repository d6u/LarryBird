//
//  MergeTests.swift
//  LarryBird
//
//  Created by Daiwei Lu on 11/8/15.
//  Copyright © 2015 Daiwei Lu. All rights reserved.
//

import XCTest
@testable import LarryBird

class MergeTests: XCTestCase {
    
    func testMergeTwoDictionary() {
        let dict1 = [
            "key1": "value1",
            "key2": "value2",
        ]
        let dict2 = [
            "key3": "value3",
            "key2": "overwritten",
        ]
        let r = merge(dict1, right: dict2)
        XCTAssertEqual(r["key1"], "value1")
        XCTAssertEqual(r["key2"], "overwritten")
        XCTAssertEqual(r["key3"], "value3")
    }

}
