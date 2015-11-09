//
//  requestWebAuthUrl.swift
//  LarryBird
//
//  Created by Daiwei Lu on 11/1/15.
//  Copyright © 2015 Daiwei Lu. All rights reserved.
//

import Foundation

//public typealias UrlFinishClosure = (error: NSError?, response: (data: [String: String], url: NSURL)?) -> Void

//public func requestWebAuthUrl(config: Config)(_ callbackUrl: String, _ finish: UrlFinishClosure) {
//    request(config, .OauthRequestToken, [.OauthCallback(callbackUrl)]) { error, data in
//        let dict = data as? [String: String]
//        if let token: String = dict?["oauth_token"] {
//            let url = NSURL(string: "https://api.twitter.com/oauth/authenticate?oauth_token=\(token)")!
//            finish(error: error, response: (data: dict!, url: url))
//        } else {
//            finish(error: error, response: nil)
//        }
//    }
//}
