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

import iTunesLibrary
import ITunesModel

public enum ITLibMediaItemLocationTypeStub: String, Codable {

    public init(_ t: ITLibMediaItemLocationType) {
        switch t {
        case .unknown: self = .unknown
        case .file: self = .file
        case .URL: self = .URL
        case .remote: self = .remote
        @unknown default: self = .unknown
        }
    }

    case unknown

    case file

    case URL

    case remote
}

extension ITLibMediaItemLocationTypeStub: ITLibMediaItemLocationTypeProtocol {
    
    public static func unknown() -> ITLibMediaItemLocationTypeStub {
        .unknown
    }

    public static func file() -> ITLibMediaItemLocationTypeStub {
        .file
    }

    public static func URL() -> ITLibMediaItemLocationTypeStub {
        .URL
    }

    public static func remote() -> ITLibMediaItemLocationTypeStub {
        .remote
    }
}
