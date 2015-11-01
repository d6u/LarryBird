//
//  requestAccessToken.swift
//  LarryBird
//
//  Created by Daiwei Lu on 11/1/15.
//  Copyright © 2015 Daiwei Lu. All rights reserved.
//

import Foundation

//public func requestAccessToken(config: Config)(_ oauthReturnUrl: NSURL, _ finish: FinishClosure) {
//    let dict = parseQueryParams(oauthReturnUrl.query!)
//
//    if let verifier = dict["oauth_verifier"] where dict["oauth_token"] != nil {
//        request(config, .OauthAccessToken, [.OauthVerifier(verifier)], finish)
//    } else {
//        let error = NSError(
//            domain: "com.daiweilu.LarryBird",
//            code: 0,
//            userInfo: [
//                "description": "OAuth return does not contain any verifier",
//                "provided_url": oauthReturnUrl.URLString
//            ])
//        finish(error: error, data: nil)
//    }
//}
