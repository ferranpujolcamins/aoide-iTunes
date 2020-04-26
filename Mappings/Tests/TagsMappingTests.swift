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

final class TagsMappingTests: XCTestCase {

    func testRatingIsMapped() {
        // Given a media item with a rating
        var mediaItem = ITLibMediaItemStub()
        mediaItem.rating = 3

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the rating is mapped into `tags`
        XCTAssertTrue(aoideTrack.tags[reservedFacetMixxxOrg]!.contains(where: { tag in
            tag.label == ratingLabel && tag.score == 0.6
        }))
    }

    func testMissingRatingIsNotMapped() {
        // Given a media item with a missing rating (rating = 0)
        var mediaItem = ITLibMediaItemStub()
        mediaItem.rating = 0

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the rating is not mapped into `tags`
        XCTAssertFalse(aoideTrack.tags[reservedFacetMixxxOrg]!.contains(where: { tag in
            tag.label == ratingLabel
        }))
    }

    func testGenreIsMapped() {
        // Given a media item with a genre
        var mediaItem = ITLibMediaItemStub()
        mediaItem.genre = "House"

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the genre is mapped into `tags`
        XCTAssertTrue(aoideTrack.tags[genreFacet]!.contains(where: { tag in
            tag.label == "House" && tag.score == 1
        }))
    }

    func testemptyGenreIsNotMapped() {
        // Given a media item with an empty genre
        var mediaItem = ITLibMediaItemStub()
        mediaItem.genre = ""

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the genre is not mapped into `tags`
        XCTAssertEqual(aoideTrack.tags[genreFacet]?.count, 0)
    }
}
