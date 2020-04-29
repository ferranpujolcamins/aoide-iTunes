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

public enum ITLibMediaItemLocationTypeStub: UInt, Codable {

    public init(_ t: ITLibMediaItemLocationType) {
        switch t {
        case .unknown: self = .unknown
        case .file: self = .file
        case .URL: self = .URL
        case .remote: self = .remote
        @unknown default: self = .unknown
        }
    }

    case unknown = 0

    case file = 1

    case URL = 2

    case remote = 3
}
