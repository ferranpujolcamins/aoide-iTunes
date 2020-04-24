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
import iTunesLibrary
@testable import aoide_iTuneslib

final class AlbumMappingTests: XCTestCase {

    func titleIsUsed() {

        // Given an album with a title defined
        var album = ITLibAlbumStub()
        album.title = "The Meaning of Life"
        album.sortTitle = "Meaning of Life"

        // When we map the album to the aoide model
        let aoideAlbum = album.mapToAoide()

        // Then the tile is used (not the sort title)
        XCTAssertEqual(aoideAlbum.titles, [Title.default(name: "The Meaning of Life")])
    }

    func sortTitleIsUsedAsFallback() {

        // Given an album with no title defined, but a sort title defined
        var album = ITLibAlbumStub()
        album.title = nil
        album.sortTitle = "Meaning of Life"

        // When we map the album to the aoide model
        let aoideAlbum = album.mapToAoide()

        // Then the sort title is used
        XCTAssertEqual(aoideAlbum.titles, [Title.default(name: "Meaning of Life")])
    }

    func albumArtistIsUsed() {

        // Given an album with an album artist defined
        var album = ITLibAlbumStub()
        album.albumArtist = "The Offspring"
        album.sortAlbumArtist = "Offspring"

        // When we map the album to the aoide model
        let aoideAlbum = album.mapToAoide()

        // Then the album artist is used (not the sort album artist)
        XCTAssertEqual(aoideAlbum.actors, [Actor.default(name: "The Offspring")])
    }

    func sortAlbumArtistIsUsedAsFallback() {

        // Given an album with no album artist defined, but a sort album artist defined
        var album = ITLibAlbumStub()
        album.albumArtist = nil
        album.sortAlbumArtist = "Offspring"

        // When we map the album to the aoide model
        let aoideAlbum = album.mapToAoide()

        // Then the sort album artist is used
        XCTAssertEqual(aoideAlbum.actors, [Actor.default(name: "Offspring")])
    }
}
