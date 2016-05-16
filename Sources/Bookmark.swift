
import Foundation

func extractBookmarksFrom(dict: NSDictionary) -> [Bookmark] {
    if let children: [NSDictionary] = dict["Children"] as! [NSDictionary]? {
        return [Bookmark](children.map(extractBookmarksFrom).flatten())
    } else if let url: String = dict["URLString"] as! String? {
        let uriDictionary = (dict["URIDictionary"] as! NSDictionary?)!
        let title = (uriDictionary["title"] as! String?)!

        return [Bookmark(title: title, url: url)]
    } else {
        return [Bookmark]()
    }
}

public struct Bookmark {

    public let title: String
    public let url: String

    static public func readFrom(path: String) -> [Bookmark]? {
        if let plist = NSDictionary(contentsOfFile: path) {
            return extractBookmarksFrom(dict: plist)
        } else {
            return nil
        }
    }

}
