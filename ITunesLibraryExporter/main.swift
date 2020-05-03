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
import ITunesModelStubs

let library = try ITLibrary(apiVersion: "1.0")
let stubs: [ITLibMediaItemStub] = library.allMediaItems
    .map(ITLibMediaItemStub.init)
    // We don't want to print the artwork data
    // TODO: avoid element copies and double iteration on the list
    .map { stub in
        var stub = stub
        stub.artwork = nil
        return stub
    }

let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted

let data = try encoder.encode(stubs)
print(String(data: data, encoding: .utf8)!)
