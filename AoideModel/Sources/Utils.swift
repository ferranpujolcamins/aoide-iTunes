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

/// Returns the result of the first closure that does not throw.
/// If all closures throw, returns nil.
func first<T>(_ cases: [() throws -> T]) -> T? {
    for f in cases {
        if let value = try? f() {
            return value
        }
    }
    return nil
}

/// Returns the result of the first closure that does not throw.
/// If all closures throw, returns nil.
func first<T>(_ cases: () throws -> T...) -> T? {
    first(cases)
}

extension Optional {
    /// Returns the value wrapped in the optional if it's present.
    /// If the optional is nil, throws the given error.
    func orThrow<E: Error>(_ error: E) throws -> Wrapped {
        if let value = self {
            return value
        }
        throw error
    }
}
