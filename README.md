[![Build Status](https://travis-ci.org/tombooth/Bookmarks.svg?branch=master)](https://travis-ci.org/tombooth/Bookmarks)

A little library to read Safari bookmarks.

# Usage

Add a dependency to your `Package.swift`

```
let bookmarks = Bookmark.readFrom(path: "/some/directory/Bookmarks.plist")
```
