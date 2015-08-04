import Foundation
import CommonCrypto

func sha1DigestString(baseStr: String, key: String) -> String {
    let str = baseStr.cStringUsingEncoding(NSUTF8StringEncoding)
    let strLen = baseStr.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)

    let digestLen = Int(CC_SHA1_DIGEST_LENGTH)
    let result = UnsafeMutablePointer<Void>.alloc(digestLen)

    let keyStr = key.cStringUsingEncoding(NSUTF8StringEncoding)!
    let keyLen = key.lengthOfBytesUsingEncoding(NSUTF8StringEncoding)

    CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), keyStr, keyLen, str!, strLen, result)

    return NSData(bytes: result, length: digestLen).base64EncodedStringWithOptions(nil)
}
