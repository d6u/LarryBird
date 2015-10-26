import Foundation
import CryptoSwift

func sha1DigestString(baseStr: String, key: String) -> String {
    let _key = key.dataUsingEncoding(NSUTF8StringEncoding)!
    let _msg = baseStr.dataUsingEncoding(NSUTF8StringEncoding)!
    let bytes = try! Authenticator.HMAC(key: _key.bytes(), variant: HMAC.Variant.sha1).authenticate(_msg.bytes())
    let data = NSData.withBytes(bytes)
    return data.base64EncodedStringWithOptions(NSDataBase64EncodingOptions.Encoding64CharacterLineLength)
}
