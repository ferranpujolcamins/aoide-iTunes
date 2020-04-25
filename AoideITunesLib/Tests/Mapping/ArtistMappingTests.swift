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

        // Given an artist with a name defined
        var artist = ITLibArtistStub()
        artist.name = "The Offspring"
        artist.sortName = "Offspring"

        // When we map the artist to the aoide model
        let aoideActor = artist.mapToAoide()

        // Then the name is used (not the sort name)
        XCTAssertEqual(aoideActor, Actor.default(name: "The Offspring"))
    }

    func testSortNameArtistIsUsedAsFallback() {

        // Given an artist with no name defined, but a sort name defined
        var artist = ITLibArtistStub()
        artist.name = nil
        artist.sortName = "Offspring"

        // When we map the artist to the aoide model
        let aoideActor = artist.mapToAoide()

        // Then the sort name is used
        XCTAssertEqual(aoideActor, Actor.default(name: "Offspring"))
    }
}
