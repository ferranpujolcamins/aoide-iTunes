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

public struct Actor: Equatable {

    public init(name: String, role: ActorRole, precedence: ActorPrecedence) {
        self.name = name
        self.role = role
        self.precedence = precedence
    }

    public let name: String

    public let role: ActorRole

    public let precedence: ActorPrecedence
}

public enum ActorRole {
    case artist
    case arranger
    case composer
    case conductor
    case djMixer
    case engineer
    case lyricist
    case mixer
    case performer
    case producer
    case publisher
    case remixer
    case writer

    public static var `default`: ActorRole { .artist }
}

public enum ActorPrecedence {
    case summary
    case primary
    case secondary

    public static var `default`: ActorPrecedence { .summary }
}
