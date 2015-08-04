## Usage

```swift
let config = Config(
    consumerKey: TWITTER_CONSUMER_KEY,
    consumerSecret: TWITTER_CONSUMER_SECRET,
    oauthToken: nil,
    oauthSecret: nil)

request(config)(.OauthRequestToken, [.OauthCallback(TWITTER_OAUTH_CALLBACK)]) { error, data in
    println(error)
    println(data)
}
```
