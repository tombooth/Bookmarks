
import Bookmarks
import XCTest

func fixturesPathTo(relativePath: String) -> String {
    return "\(NSFileManager.default().currentDirectoryPath)/Tests/Fixtures/\(relativePath)"
}

final class BookmarkTests: XCTestCase {

    func testReadingBookmarks() {
        if let bookmarks = Bookmark.readFrom(path: fixturesPathTo(relativePath: "Bookmarks.plist")) {
            XCTAssertEqual(bookmarks.count, 2, "Should have at two bookmarks")

            XCTAssertEqual(bookmarks[0].url, "http://www.cgpgrey.com/politics-in-the-animal-kingdom/")
            XCTAssertEqual(bookmarks[0].title, "Politics in the Animal Kingdom — CGP Grey")
            XCTAssertEqual(bookmarks[1].url, "http://www.cnn.com/")
            XCTAssertEqual(bookmarks[1].title, "CNN")
        } else {
            XCTFail("We should have some bookmarks")
        }
    }

    func testNilOnBadPath() {
        let bookmarks = Bookmark.readFrom(path: fixturesPathTo(relativePath: "not-a-file"))

        XCTAssert(bookmarks == nil, "Bad path so shouldn't return any bookmarks")
    }

}
