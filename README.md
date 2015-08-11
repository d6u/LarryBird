# LarryBird

LarryBird is an alternative Twitter client written in Swift.

## Usage

```swift
request(config)(.FriendsIds, [.UserIds(["123", "456"])]) { error, data in
    // Deal with error or data
}
```

Unlike other library, instead of creating a instance of Twitter client, LarryBird only has one `request` function. To achieve the same convenience of storing Twitter API credentials, `request` can be curried by passing the first argument. The first argument is a `Config` struct contains Twitter API credentials, which can be constructed like so:

```swift
let config = Config(
    consumerKey: TWITTER_CONSUMER_KEY,
    consumerSecret: TWITTER_CONSUMER_SECRET,
    oauthToken: nil,
    oauthSecret: nil)
```

The signature of curried function is:

```swift
(_ endpoint: Endpoint, _ params: [Param], _ finish: (error: NSError?, data: AnyObject?) -> Void) -> Void
```

LarryBird has a set of `Endpoint` enum cases to specify which Twitter API endpoint the request should go to. You can pass arbitrary `Param` enum as an array as parameters for the request. A list of available `Endpoint` and `Param` can be found in [Endpoint.swift](https://github.com/d6u/LarryBird/blob/master/LarryBird/Endpoint.swift) and [Param.swift](https://github.com/d6u/LarryBird/blob/master/LarryBird/Param.swift).

The choice to use enum is to ensure strong type check and reduce API surface.

## Convenient Utility

LarryBird provides two additional function to specifically help Twitter login flow.

```swift
func requestWebAuthUrl
    (config: Config)
    (_ callbackUrl: String, _ finish: (error: NSError?, response: (data: [String: String], url: NSURL)?) -> Void)

func requestAccessToken
    (config: Config)
    (_ oauthReturnUrl: NSURL, _ finish: (error: NSError?, data: AnyObject?) -> Void)
```

`requestWebAuthUrl` is used to get API request token and construct a Twitter sign in url. You can open this url in the browser to start a login flow.

`requestAccessToken` can be used to parse the response url returned by a success Twitter web authentication, and exchange for an access token to construct a `Config` object.

## Install

```
pod 'LarryBird', :git => 'https://github.com/d6u/LarryBird.git'
```

## Why Just One Function

Reactive functional programing gives us a lot of powerful concepts to deal with interaction intensive UIs. One of the benefits is the elimination of states in it's reactive codes. Normal API client holds credentials as ivars, which is hard for reactive codes to update credentials when following the Twitter auth flow. A signal function is much easier to use in reactive codes.
