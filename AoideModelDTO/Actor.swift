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
import AoideModel

public enum ActorDTO: Equatable {
    case name(String)
    case nameRole(String, ActorRole)
    case nameRolePrecedence(String, ActorRole, ActorPrecedence)
}

extension ActorDTO: Codable {

    public init(from decoder: Decoder) throws {
        var container = try decoder.unkeyedContainer()
        let name = try container.decode(String.self)
        if let role = try? container.decode(ActorRole.self) {
            if let precedence = try? container.decode(ActorPrecedence.self) {
                self = .nameRolePrecedence(name, role, precedence)
            } else {
                self = .nameRole(name, role)
            }
        } else {
            self = .name(name)
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.unkeyedContainer()
        switch self {
        case .name(let name):
            try container.encode(name)
        case .nameRole(let name, let actorRole):
            try container.encode(name)
            try container.encode(actorRole)
        case .nameRolePrecedence(let name, let actorRole, let actorPrecedence):
            try container.encode(name)
            try container.encode(actorRole)
            try container.encode(actorPrecedence)
        }
    }
}

extension ActorDTO {
    public func model() -> Actor {
        switch self {
        case .name(let name):
            return Actor(name: name, role: .default, precedence: .default)
        case .nameRole(let name, let role):
            return Actor(name: name, role: role, precedence: .default)
        case .nameRolePrecedence(let name, let role, let precedence):
            return Actor(name: name, role: role, precedence: precedence)
        }
    }
}

extension Actor {
    public func dto() -> ActorDTO {
        .nameRolePrecedence(name, role, precedence)
    }
}
