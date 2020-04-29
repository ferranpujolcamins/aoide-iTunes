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

public struct ITLibAlbumStub: ITLibAlbumProtocol {

    public init(
        albumArtist: String? = nil,
        discCount: Int = 0,
        discNumber: Int = 0,
        isCompilation: Bool = false,
        isGapless: Bool = false,
        isRatingComputed: Bool = false,
        persistentID: Double = 0,
        rating: Int = 0,
        sortAlbumArtist: String? = nil,
        sortTitle: String? = nil,
        title: String? = nil,
        trackCount: Int = 0
    ) {
        self.albumArtist = albumArtist
        self.discCount = discCount
        self.discNumber = discNumber
        self.isCompilation = isCompilation
        self.isGapless = isGapless
        self.isRatingComputed = isRatingComputed
        self.persistentID = persistentID
        self.rating = rating
        self.sortAlbumArtist = sortAlbumArtist
        self.sortTitle = sortTitle
        self.title = title
        self.trackCount = trackCount
    }

    public init<T: ITLibAlbumProtocol>(_ t: T) where T.PersistentID == NSNumber {
        self.init(
            albumArtist: t.albumArtist,
            discCount: t.discCount,
            discNumber: t.discNumber,
            isCompilation: t.isCompilation,
            isGapless: t.isGapless,
            isRatingComputed: t.isRatingComputed,
            persistentID: t.persistentID.doubleValue,
            rating: t.rating,
            sortAlbumArtist: t.sortAlbumArtist,
            sortTitle: t.sortTitle,
            title: t.title,
            trackCount: t.trackCount
        )
    }

    public var albumArtist: String?

    public var discCount: Int

    public var discNumber: Int

    public var isCompilation: Bool

    public var isGapless: Bool

    public var isRatingComputed: Bool

    public var persistentID: Double

    public var rating: Int

    public var sortAlbumArtist: String?

    public var sortTitle: String?

    public var title: String?

    public var trackCount: Int
}
