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

public struct ITLibMediaItemStub: ITLibMediaItemProtocol {

    public init() {}
    
    public var addedDateProperty: Date? = nil
    public var album: ITLibAlbumStub = ITLibAlbumStub()
    public var artist: ITLibArtistStub? = nil
    public var artwork: ITLibArtworkStub? = nil
    public var beatsPerMinute: Int = 0
    public var bitrate: Int = 0
    public var category: String? = nil
    public var comments: String? = nil
    public var composer: String = ""
    public var contentRating: String? = nil
    public var description: String? = nil
    public var fileSize: UInt64 = 0
    public var genre: String = ""
    public var grouping: String? = nil
    public var hasArtworkAvailable: Bool = false
    public var isCloud: Bool = false
    public var isDRMProtected: Bool = false
    public var isPurchased: Bool = false
    public var isRatingComputed: Bool = false
    public var isUserDisabled: Bool = false
    public var isVideo: Bool = false
    public var kind: String? = nil
    public var lastPlayedDate: Date? = nil
    public var location: URL? = URL(fileURLWithPath: "")
    public var locationType: ITLibMediaItemLocationTypeStub = .unknown
    public var lyricsContentRating: ITLibMediaItemLyricsContentRatingStub = .none
    public var mediaKind: ITLibMediaItemMediaKindStub = .kindUnknown
    public var modifiedDate: Date? = nil
    public var playCount: Int = 0
    public var playStatus: ITLibMediaItemPlayStatusStub = .none
    public var rating: Int = 0
    public var releaseDate: Date? = nil
    public var sampleRate: Int = 0
    public var skipCount: Int = 0
    public var skipDate: Date? = nil
    public var sortComposer: String? = nil
    public var sortTitle: String? = nil
    public var startTime: Int = 0
    public var stopTime: Int = 0
    public var title: String = ""
    public var totalTime: Int = 0
    public var trackNumber: Int = 0
    public var videoInfo: ITLibMediaItemVideoInfoStub? = nil
    public var voiceOverLanguage: String? = nil
    public var volumeAdjustment: Int = 0
    public var volumeNormalizationEnergy: Int = 0
    public var year: Int = 0
}
