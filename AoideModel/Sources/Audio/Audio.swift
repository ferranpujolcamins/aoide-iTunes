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

public struct AudioContent {
    
    public let channels: Channels

    public let duration: DurationMs

    public let sample_rate: SampleRateHz

    public let bit_rate: BitRateBps

    public let loudness: LoudnessLufs?

    public let encoder: AudioEncoder?
}

public typealias PositionMs = Float64
public typealias DurationMs = Float64

public struct AudioEncoder {
    public let name: String

    public let settings: String?
}
