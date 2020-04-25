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
@testable import AoideITunesLib

final class AlbumMappingTests: XCTestCase {

    func testTitleIsMapped() {

        // Given a media item with an album title defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.album.title = "The Offspring"
        mediaItem.album.sortTitle = "Offspring"

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the album title is mapped (not the album sort title)
        XCTAssertEqual(aoideTrack.album?.titles, [Title.default(name: "The Offspring")])
    }

    func testSortTitleIsMappedAsFallback() {

        // Given a media item with no album title defined, but an album sort title defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.album.title = nil
        mediaItem.album.sortTitle = "Offspring"

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the album sort title is mapped
        XCTAssertEqual(aoideTrack.album?.titles, [Title.default(name: "Offspring")])
    }

    func testAlbumArtistIsMappedToActors() {

        // Given a media item with an album artist defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.album.albumArtist = "The Offspring"
        mediaItem.album.sortAlbumArtist = "Offspring"

        // When we map the album to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the album artist is mapped (not the album sort artist)
        // as artist with default precedence
        XCTAssertEqual(
            aoideTrack.album?.actors,
            [Actor(name: "The Offspring", role: .artist, precedence: .default)]
        )
    }

    func testSortAlbumArtistIsMappedToActorsAsFallback() {

        // Given a media item with no album artist defined, but an album sort artist defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.album.albumArtist = nil
        mediaItem.album.sortAlbumArtist = "Offspring"

        // When we map the album to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the sort album artist is mapped as artist with default precedence
        XCTAssertEqual(
            aoideTrack.album?.actors,
            [Actor(name: "Offspring", role: .artist, precedence: .default)]
        )
    }
}
