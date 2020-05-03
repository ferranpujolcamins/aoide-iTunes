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

import Foundation
import AoideModel
import ITunesModel

extension ITLibMediaItemProtocol {
    func markers() -> Markers {
        Markers(
            positions: positionMarkers(),
            beats: beatMarkers(),
            keys: .empty
        )
    }

    func positionMarkers() -> PositionMarkers {
        PositionMarkers(
            state: .readOnly,
            markers: mainMarker()
        )
    }

    func mainMarker() -> [PositionMarker] {
        guard startTime != 0 || stopTime != totalTime else { return [] }

        return [PositionMarker(
            start: PositionMs(startTime),
            end: PositionMs(stopTime),
            type: .main,
            number: nil,
            color: nil,
            label: nil
        )]
    }

    func beatMarkers() -> BeatMarkers {
        BeatMarkers(
            state: .readOnly,
            markers: bpmMarker()
        )
    }

    func bpmMarker() -> [BeatMarker] {
        guard beatsPerMinute != 0 else { return [] }

        return [BeatMarker(
            start: 0,
            end: nil,
            tempo: TempoBpm(beatsPerMinute),
            timing: nil,
            beat_at_start: nil
        )]
    }

}
