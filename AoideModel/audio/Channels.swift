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

public enum Channels: Equatable {
    case count(UInt16)
    case layout(ChannelLayout)
}

public enum ChannelLayout: String, Equatable, Codable {
    case mono
    case dualMono
    case stereo
}

extension Channels: Codable {

    public init(from decoder: Decoder) throws {
        self = try first(
            { return try Channels.count(decoder.singleValueContainer().decode(UInt16.self)) },
            { return try Channels.layout(ChannelLayout(from: decoder)) }
        ).orThrow(NSError())
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .count(let count):
            try count.encode(to: encoder)
        case .layout(let layout):
            try layout.encode(to: encoder)
        }
    }
}

extension ChannelLayout {
    enum CodingKeys: CodingKey {
        case mono
        case dualMono
        case stereo
    }
}
