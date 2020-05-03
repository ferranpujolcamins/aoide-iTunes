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

public struct Release: Equatable, Codable {

    public init(
        releasedAt: ReleasedAt?,
        releasedBy: String?,
        copyright: String?,
        licenses: [String]
    ) {
        self.releasedAt = releasedAt
        self.releasedBy = releasedBy
        self.copyright = copyright
        self.licenses = licenses
    }


    public let releasedAt: ReleasedAt?

    public let releasedBy: String? // record label

    public let copyright: String?
    
    public let licenses: [String]
}

public enum ReleasedAt: Equatable {
    case date(ReleaseDate)
    case dateTime(Date)
}

extension ReleasedAt: Codable {

    public init(from decoder: Decoder) throws {
        self = try first(
            { return try ReleasedAt.date(ReleaseDate(from: decoder)) },
            { return try ReleasedAt.dateTime(decoder.singleValueContainer().decode(Date.self)) }
        ).orThrow(NSError())
    }

    public func encode(to encoder: Encoder) throws {
        switch self {
        case .date(let releaseDate):
            try releaseDate.encode(to: encoder)
        case .dateTime(let date):
            try date.encode(to: encoder)
        }
    }
}
