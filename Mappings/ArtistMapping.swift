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
import ITunesModel

extension ITLibArtistProtocol {
    public func mapToAoide() -> Actor? {
        let trimmedName = name?.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedSortName = sortName?.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return Optional.first([
                validate(trimmedName, { !$0.isEmpty }),
                validate(trimmedSortName, { !$0.isEmpty })
            ])
            .map { Actor(name: $0, role: .artist, precedence: .default) }
    }
}
