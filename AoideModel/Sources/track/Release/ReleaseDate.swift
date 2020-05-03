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

// 4-digit year
public typealias ReleaseYear = Int16

// 2-digit month
public typealias ReleaseMonth = Int8

// 2-digit day of month
public typealias ReleaseDayOfMonth = Int8

public let releaseYearMin: ReleaseYear = 1
public let releaseYearMax: ReleaseYear = 9999

public typealias YYYYMMDD = Int32

// 8-digit year+month+day (YYYYMMDD)
public struct ReleaseDate: Equatable, Codable {

    public init(_ yyyymmdd: YYYYMMDD) {
        self.yyyymmdd = yyyymmdd
    }

    let yyyymmdd: YYYYMMDD
}

extension ReleaseDate {
    public func min() -> Self {
        Self(10_000)
    }

    public func max() -> Self {
        Self(99_999_999)
    }

    public var year: ReleaseYear {
        ReleaseYear(yyyymmdd / 10_000)
    }

    public var month: ReleaseMonth {
        ReleaseMonth((yyyymmdd % 10_000) / 100)
    }

    public var dayOfMonth: ReleaseDayOfMonth {
        ReleaseDayOfMonth(yyyymmdd % 100)
    }

    public static func fromYear(_ year: ReleaseYear) -> Self {
        Self(YYYYMMDD(year) * 10_000)
    }

    public var isYear: Bool {
        .fromYear(year) == self
    }
}
