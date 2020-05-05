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

public enum LogMessage: CustomStringConvertible {
    case requestSuccesful(method: String, url: String)
    case successfullyParsed(method: String, url: String)
    case requestBody(String)

    public var description: String {
        switch self {
        case .requestSuccesful(method: let method, url: let url):
            return "\(method) request to \(url) successful"
        case .successfullyParsed(method: let method, url: let url):
            return "response to \(method) request to \(url) successfully parsed"
        case .requestBody(let body):
            return body
        }
    }
}
