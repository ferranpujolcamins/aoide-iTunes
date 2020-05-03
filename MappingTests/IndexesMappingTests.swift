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

final class IndexesMappingTests: XCTestCase {

    // MARK: Disc

    func testDiscNumberIsMapped() {
        // Given a media item with a disc number but no disc count
        var mediaItem = ITLibMediaItemStub()
        mediaItem.album.discNumber = 1
        mediaItem.album.discCount = 0

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the disc number and count are mapped to indexes
        XCTAssertEqual(aoideTrack.indexes.disc, Index(number: 1, total: 0))
    }

    func testDiscCountIsMapped() {
        // Given a media item with a disc count but no disc number
        var mediaItem = ITLibMediaItemStub()
        mediaItem.album.discNumber = 0
        mediaItem.album.discCount = 1

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the disc number and count are mapped to indexes
        XCTAssertEqual(aoideTrack.indexes.disc, Index(number: 0, total: 1))
    }

    func testDiscNumberAndCountAreMapped() {
        // Given a media item with a disc number and a disc count
        var mediaItem = ITLibMediaItemStub()
        mediaItem.album.discNumber = 1
        mediaItem.album.discCount = 2

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the disc number and count are mapped to indexes
        XCTAssertEqual(aoideTrack.indexes.disc, Index(number: 1, total: 2))
    }

    func testDiscNumberAndCountAreNotMapped() {
        // Given a media item with no disc number and no disc count
        var mediaItem = ITLibMediaItemStub()
        mediaItem.album.discNumber = 0
        mediaItem.album.discCount = 0

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the disc number and count are not mapped to indexes
        XCTAssertNil(aoideTrack.indexes.disc)
    }

    // MARK: Track

    func testTrackNumberIsMapped() {
        // Given a media item with a track number but no track count
        var mediaItem = ITLibMediaItemStub()
        mediaItem.trackNumber = 1
        mediaItem.album.trackCount = 0

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the track number and count are mapped to indexes
        XCTAssertEqual(aoideTrack.indexes.track, Index(number: 1, total: 0))
    }

    func testTrackCountIsMapped() {
        // Given a media item with a track count but no track number
        var mediaItem = ITLibMediaItemStub()
        mediaItem.trackNumber = 0
        mediaItem.album.trackCount = 1

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the track number and count are mapped to indexes
        XCTAssertEqual(aoideTrack.indexes.track, Index(number: 0, total: 1))
    }

    func testTrackNumberAndCountAreMapped() {
        // Given a media item with a track number and a track count
        var mediaItem = ITLibMediaItemStub()
        mediaItem.trackNumber = 1
        mediaItem.album.trackCount = 2

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the track number and count are mapped to indexes
        XCTAssertEqual(aoideTrack.indexes.track, Index(number: 1, total: 2))
    }

    func testTrackNumberAndCountAreNotMapped() {
        // Given a media item with no track number and no track count
        var mediaItem = ITLibMediaItemStub()
        mediaItem.trackNumber = 0
        mediaItem.album.trackCount = 0

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the track number and count are not mapped to indexes
        XCTAssertNil(aoideTrack.indexes.track)
    }

    // Movement:

    func testMovementIsNotMapped() {
        // Given a media item
        let mediaItem = ITLibMediaItemStub()

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide(mimeType: "")

        // Then the movement number and count are not mapped to indexes
        XCTAssertNil(aoideTrack.indexes.movement)
    }
}
