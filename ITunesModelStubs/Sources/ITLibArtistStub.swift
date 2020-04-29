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
import ITunesModel

public struct ITLibArtistStub: ITLibArtistProtocol, Codable {

    public init(name: String? = nil, persistentID: UInt64 = 0, sortName: String? = nil) {
        self.name = name
        self.persistentID = persistentID
        self.sortName = sortName
    }

    public init<T: ITLibArtistProtocol>(_ t: T) where T.PersistentID == NSNumber {
        self.init(
            name: t.name,
            persistentID: t.persistentID.uint64Value,
            sortName: t.sortName
        )
    }

    public var name: String?

    public var persistentID: UInt64

    public var sortName: String?
}
