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

public struct Index {

    public init(number: UInt16, total: UInt16) {
        self.number = number
        self.total = total
    }

    public let number: UInt16

    public let total: UInt16
}

public struct Indexes {

    public init(disc: Index, track: Index, movement: Index) {
        self.disc = disc
        self.track = track
        self.movement = movement
    }

    public let disc: Index

    public let track: Index

    public let movement: Index
}
