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
@testable import aoide_iTuneslib

struct ITLibAlbumStub: ITLibAlbumProtocol {

    var albumArtist: String? = nil

    var discCount: Int = 0

    var discNumber: Int = 0

    var isCompilation: Bool = false

    var isGapless: Bool = false

    var isRatingComputed: Bool = false

    var persistentID: NSNumber = 0

    var rating: Int = 0

    var sortAlbumArtist: String? = nil

    var sortTitle: String? = nil

    var title: String? = nil

    var trackCount: Int = 0
}
