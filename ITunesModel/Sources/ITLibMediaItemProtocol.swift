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

public let maxRating = 5

public protocol ITLibMediaItemProtocol {

    associatedtype Album: ITLibAlbumProtocol
    associatedtype Artist: ITLibArtistProtocol
    associatedtype Artwork: ITLibArtworkProtocol

    var addedDateProperty: Date? { get }
    var album: Album { get }
    var artist: Artist? { get }
    var artwork: Artwork? { get }
    var beatsPerMinute: Int { get }
    var bitrate: Int { get }
    var category: String? { get }
    var comments: String? { get }
    var composer: String { get }
    var contentRating: String? { get }
    var description: String? { get }
    var fileSize: UInt64 { get }
    var genre: String { get }
    var grouping: String? { get }
    var hasArtworkAvailable: Bool { get }
    var isCloud: Bool { get }
    var isDRMProtected: Bool { get }
    var isPurchased: Bool { get }
    var isRatingComputed: Bool { get }
    var isUserDisabled: Bool { get }
    var isVideo: Bool { get }
    var kind: String? { get }
    var lastPlayedDate: Date? { get }
    var location: URL? { get }
//    var locationType: ITLibMediaItemLocationType { get }
//    var lyricsContentRating: ITLibMediaItemLyricsContentRating { get }
//    var mediaKind: ITLibMediaItemMediaKind { get }
    var modifiedDate: Date? { get }
    var playCount: Int { get }
//    var playStatus: ITLibMediaItemPlayStatus { get }
    var rating: Int { get }
    var releaseDate: Date? { get }
    var sampleRate: Int { get }
    var skipCount: Int { get }
    var skipDate: Date? { get }
    var sortComposer: String? { get }
    var sortTitle: String? { get }
    var startTime: Int { get }
    var stopTime: Int { get }
    var title: String { get }
    var totalTime: Int { get }
    var trackNumber: Int { get }
//    var videoInfo: ITLibMediaItemVideoInfo? { get }
    var voiceOverLanguage: String? { get }
    var volumeAdjustment: Int { get }
    var volumeNormalizationEnergy: Int { get }
    var year: Int { get }
}

extension ITLibMediaItem: ITLibMediaItemProtocol {}
