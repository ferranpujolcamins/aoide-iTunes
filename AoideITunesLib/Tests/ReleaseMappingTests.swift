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

final class ReleaseMappingTests: XCTestCase {

    func testReleaseDateIsMapped() {
        // Given a media item with a release date
        let date = Date()
        var mediaItem = ITLibMediaItemStub()
        mediaItem.releaseDate = date

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the release date is mapped to `release`
        XCTAssertEqual(aoideTrack.release, Release(
            released_at: date,
            released_by: nil,
            copyright: nil,
            licenses: []
        ))
    }
}
