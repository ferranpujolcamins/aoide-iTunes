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

final class ArtistMappingTests: XCTestCase {

    func testNameIsUsed() {

        // Given a media item with an artist name defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.artist = ITLibArtistStub()
        mediaItem.artist?.name = "The Offspring"
        mediaItem.artist?.sortName = "Offspring"

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the artist name is mapped (not the artist sort name)
        XCTAssertEqual(aoideTrack.actors, [Actor.default(name: "The Offspring")])
    }

    func testSortNameArtistIsUsedAsFallback() {

        // Given a media item with no artist name defined, but an artist sort name defined
        var mediaItem = ITLibMediaItemStub()
        mediaItem.artist = ITLibArtistStub()
        mediaItem.artist?.name = nil
        mediaItem.artist?.sortName = "Offspring"

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the sort name is used
        XCTAssertEqual(aoideTrack.actors, [Actor.default(name: "Offspring")])
    }
}
