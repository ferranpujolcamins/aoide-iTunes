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

final class ArtistMappingTests: XCTestCase {

    func testArtistNameIsMappedToActors() {

        // Given a media item with an artist name defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.artist = ITLibArtistStub()
        mediaItem.artist?.name = "The Offspring"
        mediaItem.artist?.sortName = "Offspring"

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the artist name is mapped (not the artist sort name) as artist with default precedence
        XCTAssertEqual(
            aoideTrack.actors,
            [Actor(name: "The Offspring", role: .artist, precedence: .default)]
        )
    }

    func testArtistSortNameIsMappedToActorsAsFallback() {

        // Given a media item with no artist name defined, but an artist sort name defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.artist = ITLibArtistStub()
        mediaItem.artist?.name = nil
        mediaItem.artist?.sortName = "Offspring"

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the sort name is mapped as artist with default precedence
        XCTAssertEqual(
            aoideTrack.actors,
            [Actor(name: "Offspring", role: .artist, precedence: .default)]
        )
    }

    func testComposerIsMappedToActors() {

        // Given a media item with a composer defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.composer = "  Steve Reich "
        mediaItem.sortComposer = " Reich, Steve "

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the composer is mapped (not the artist sort name) as composer with default precedence
        XCTAssertEqual(
            aoideTrack.actors,
            [Actor(name: "Steve Reich", role: .composer, precedence: .default)]
        )
    }

    func testSortComposerIsMappedToActorsAsFallback() {

        // Given a media item with no artist name defined, but an artist sort name defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.composer = "    "
        mediaItem.sortComposer = " Reich, Steve  "

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the sort name is mapped as artist with default precedence
        XCTAssertEqual(
            aoideTrack.actors,
            [Actor(name: "Reich, Steve", role: .composer, precedence: .default)]
        )
    }

    func testAllActorsAreMapped() {

        // Given a media item with an artist and a composer defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.artist = ITLibArtistStub()
        mediaItem.artist?.name = "Eighth Blackbird"
        mediaItem.composer = "Steve Reich"

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the artist and the composer are mapped to actors
        XCTAssertEqual(
            aoideTrack.actors,
            [
                Actor(name: "Eighth Blackbird", role: .artist, precedence: .default),
                Actor(name: "Steve Reich", role: .composer, precedence: .default)
            ]
        )
    }
}
