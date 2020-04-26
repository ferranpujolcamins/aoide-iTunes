// Copyright (C) 2020 Ferran Pujol Camins et al.
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as
// published by the Free Software Foundation, either version 3 of the
// License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.
//
// You should have received a copy of the GNU Affero General Public License
// along with this program. If not, see <https://www.gnu.org/licenses/>.

import XCTest
import ITunesModelStubs
import AoideModel
import Mappings

final class TitleMappingTests: XCTestCase {

    func testTitleIsMapped() {
        // Given a media item with a title and sort title
        var mediaItem = ITLibMediaItemStub()
        mediaItem.title = "  The Meaning of Life  "
        mediaItem.sortTitle = " Meaning of Life  "

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the title is mapped to `titles` with leading and trailing whitespace removed
        XCTAssertEqual(aoideTrack.titles, [Title.default(name: "The Meaning of Life")])
    }

    func testSortTitleIsMappedAsFallback() {
        // Given a media item with no title, but a sort title defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.title = "    "
        mediaItem.sortTitle = "  Meaning of Life "

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the sort title is mapped to `titles` with leading and trailing whitespace removed
        XCTAssertEqual(aoideTrack.titles, [Title.default(name: "Meaning of Life")])
    }
}
