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

final class ReleaseMappingTests: XCTestCase {

    func testReleaseDateIsMapped() {
        // Given a media item with a release date
        let date = Date()
        var mediaItem = ITLibMediaItemStub()
        mediaItem.releaseDate = date

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the release date is mapped to `release` (not the release year)
        XCTAssertEqual(aoideTrack.release, Release(
            releasedAt: .dateTime(date),
            releasedBy: nil,
            copyright: nil,
            licenses: []
        ))
    }

    func testReleaseYearIsMappedAsFallback() {
        // Given a media item with no release date defined, but release year defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.releaseDate = nil
        mediaItem.year = 2002

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the release year is mapped to `release`
        XCTAssertEqual(aoideTrack.release, Release(
            releasedAt: .date(.fromYear(2002)),
            releasedBy: nil,
            copyright: nil,
            licenses: []
        ))
    }

    func testReleaseDateAndYearAreNotMapped() {
        // Given a media item with no release date and no release year defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.releaseDate = nil
        mediaItem.year = 0

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then nor the release date or year are mapped to `release`
        XCTAssertEqual(aoideTrack.release, Release(
            releasedAt: nil,
            releasedBy: nil,
            copyright: nil,
            licenses: []
        ))
    }
}
