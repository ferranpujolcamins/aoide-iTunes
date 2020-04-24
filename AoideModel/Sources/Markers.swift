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

public struct Markers {

    public let positions: PositionMarkers

    public let beats: BeatMarkers

    public let keys: KeyMarkers
}

public struct PositionMarkers {

    public let state: State

    public let markers: [PositionMarker]
}

public struct BeatMarkers {

    public let state: State

    public let markers: [BeatMarker]
}

public struct KeyMarkers {

    public let state: State

    public let markers: [KeyMarker]
}

public struct PositionMarker {

    public let start: PositionMs?

    public let end: PositionMs?

    public let type: PositionMarkerType

    public let number: Int32?

    public let color: ColorRgb?

    public let label: String?
}

public struct BeatMarker {

    public let start: PositionMs

    public let end: PositionMs?

    public let tempo: TempoBpm?

    public let timing: TimeSignature?

    public let beat_at_start: BeatNumber?
}

public struct KeyMarker {

    public let start: PositionMs

    public let end: PositionMs?

    public let key: KeySignature
}

public enum State: UInt8 {
    case readWrite = 0
    case readOnly = 1
}

public enum PositionMarkerType: UInt8 {
    case custom = 0
    case load = 1
    case main = 2
    case intro = 3
    case outro = 4
    case jump = 5
    case loop = 6
    case sample = 7
}

public struct TimeSignature {
    // number of beats in each measure unit or bar, 0 = default/undefined
    public let top: BeatNumber

    // beat value (the note that counts as one beat), 0 = default/undefined
    public let bottom: BeatNumber?
}

public typealias TempoBpm = Float64
public typealias BeatNumber = UInt16
public typealias KeySignature = UInt8
public typealias ColorRgb = UInt32
