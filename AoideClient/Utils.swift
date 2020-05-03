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
import Bow
import BowEffects

extension IO where A == Data, E == Error {
    func decode<T: Decodable>(_ t: T.Type) -> IO<Error, T> {
        flatMap { $0.decode(T.self) }^
    }
}

extension Data {
    func decode<T: Decodable>(_ t: T.Type) -> IO<Error, T> {
        IO<Error, T>.invoke { try JSONDecoder().decode(T.self, from: self) }
    }
}
