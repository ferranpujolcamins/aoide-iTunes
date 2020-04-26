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

final class MarkersMappingTests: XCTestCase {

    func testBpmIsMapped() {
        // Given a media item with bpm
        var mediaItem = ITLibMediaItemStub()
        mediaItem.beatsPerMinute = 128

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the bpm is mapped as a marker
        XCTAssertEqual(aoideTrack.markers, Markers(
            positions: .empty,
            beats: BeatMarkers(
                state: .readOnly,
                markers: [BeatMarker(
                    start: 0,
                    end: nil,
                    tempo: 128,
                    timing: nil,
                    beat_at_start: nil
                )]
            ),
            keys: .empty
        ))
    }

    func testBpmIsIgnoredWhenZero() {
        // Given a media item with bpm
        var mediaItem = ITLibMediaItemStub()
        mediaItem.beatsPerMinute = 0

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the bpm is not mapped as a marker
        XCTAssertEqual(aoideTrack.markers, Markers(
            positions: .empty,
            beats: .empty,
            keys: .empty
        ))
    }

    func testMainMarkerIsAddedWhenStartTimeIsSet() {
        // Given a media item with a startTime
        var mediaItem = ITLibMediaItemStub()
        mediaItem.startTime = 10
        mediaItem.totalTime = 100
        mediaItem.stopTime = 100

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the main marker is included
        XCTAssertEqual(aoideTrack.markers, Markers(
            positions: PositionMarkers(state: .readOnly, markers: [
                PositionMarker(
                    start: 10,
                    end: 100,
                    type: .main,
                    number: nil,
                    color: nil,
                    label: nil
                )
            ]),
            beats: .empty,
            keys: .empty
        ))
    }

    func testMainMarkerIsAddedWhenStopTimeIsSet() {
        // Given a media item with a stopTime
        var mediaItem = ITLibMediaItemStub()
        mediaItem.startTime = 0
        mediaItem.totalTime = 100
        mediaItem.stopTime = 90

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the main marker is included
        XCTAssertEqual(aoideTrack.markers, Markers(
            positions: PositionMarkers(state: .readOnly, markers: [
                PositionMarker(
                    start: 0,
                    end: 90,
                    type: .main,
                    number: nil,
                    color: nil,
                    label: nil
                )
            ]),
            beats: .empty,
            keys: .empty
        ))
    }

    func testMainMarkerIsAddedWhenTimesAreSet() {
        // Given a media item with a startTime and a stopTime
        var mediaItem = ITLibMediaItemStub()
        mediaItem.startTime = 10
        mediaItem.totalTime = 100
        mediaItem.stopTime = 90

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the main marker is included
        XCTAssertEqual(aoideTrack.markers, Markers(
            positions: PositionMarkers(state: .readOnly, markers: [
                PositionMarker(
                    start: 10,
                    end: 90,
                    type: .main,
                    number: nil,
                    color: nil,
                    label: nil
                )
            ]),
            beats: .empty,
            keys: .empty
        ))
    }

    func testMainMarkerIsNotAddedWhenTimesNotSet() {
        // Given a media item with startTime and stopTime set at the beginning and end of the track.
        var mediaItem = ITLibMediaItemStub()
        mediaItem.startTime = 0
        mediaItem.totalTime = 100
        mediaItem.stopTime = 100

        // When we map the media item to the aoide model
        let aoideTrack = mediaItem.mapToAoide()

        // Then the main marker is not included
        XCTAssertEqual(aoideTrack.markers, Markers(
            positions: .empty,
            beats: .empty,
            keys: .empty
        ))
    }
}
