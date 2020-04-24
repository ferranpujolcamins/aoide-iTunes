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

public struct Title: Equatable {

    public let name: String
    
    public let level: TitleLevel

    public static func `default`(name: String) -> Title {
        Title(name: name, level: .default)
    }
}

public enum TitleLevel {

    case main

    case sub

    // for classical music, only used for tracks not albums
    case work

    case movement

    public static var `default`: TitleLevel { .main }
}
