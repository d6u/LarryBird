import Foundation

public enum Param {

    case OauthCallback(String)
    case OauthVerifier(String)
    case UserId(String)
    case ScreenName(String)
    case StringifyIds(Bool)
    case Count(Int16)
    case UserIds([String])
    case ScreenNames([String])
    case IncludeEntities(Bool)
    case SinceId(String)
    case MaxId(String)
    case TrimUser(Bool)
    case ExcludeReplies(Bool)
    case ContributorDetails(Bool)

    var pair: (key: String, value: String) {
        switch self {
        case .OauthCallback(let callback):
            return (key: "oauth_callback", value: callback)
        case .OauthVerifier(let verifier):
            return (key: "oauth_verifier", value: verifier)
        case .UserId(let id):
            return (key: "user_id", value: id)
        case .ScreenName(let screen_name):
            return (key: "screen_name", value: screen_name)
        case .StringifyIds(let isTrue):
            return (key: "stringify_ids", value: isTrue ? "true" : "false")
        case .Count(let count):
            return (key: "count", value: String(count))
        case .UserIds(let ids):
            return (key: "user_id", value: ids.joinWithSeparator(","))
        case .ScreenNames(let names):
            return (key: "screen_name", value: names.joinWithSeparator(","))
        case .IncludeEntities(let isTrue):
            return (key: "include_entities", value: isTrue ? "true" : "false")
        case .SinceId(let since_id):
            return (key: "since_id", value: since_id)
        case .MaxId(let max_id):
            return (key: "max_id", value: max_id)
        case .TrimUser(let isTrue):
            return (key: "trim_user", value: isTrue ? "true" : "false")
        case .ExcludeReplies(let isTrue):
            return (key: "exclude_replies", value: isTrue ? "true" : "false")
        case .ContributorDetails(let isTrue):
            return (key: "contributor_details", value: isTrue ? "true" : "false")
        }
    }
}
