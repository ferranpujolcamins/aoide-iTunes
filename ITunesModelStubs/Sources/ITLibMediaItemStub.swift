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
import ITunesModel

public struct ITLibMediaItemStub: ITLibMediaItemProtocol {
    public init(
        addedDateProperty: Date? = nil,
        album: ITLibAlbumStub = ITLibAlbumStub(),
        artist: ITLibArtistStub? = nil,
        artwork: ITLibArtworkStub? = nil,
        beatsPerMinute: Int = 0,
        bitrate: Int = 0,
        category: String? = nil,
        comments: String? = nil,
        composer: String = "",
        contentRating: String? = nil,
        description: String? = nil,
        fileSize: UInt64 = 0,
        genre: String = "",
        grouping: String? = nil,
        hasArtworkAvailable: Bool = false,
        isCloud: Bool = false,
        isDRMProtected: Bool = false,
        isPurchased: Bool = false,
        isRatingComputed: Bool = false,
        isUserDisabled: Bool = false,
        isVideo: Bool = false,
        kind: String? = nil,
        lastPlayedDate: Date? = nil,
        location: URL? = URL(fileURLWithPath: ""),
        locationType: ITLibMediaItemLocationTypeStub = .unknown,
        lyricsContentRating: ITLibMediaItemLyricsContentRatingStub = .none,
        mediaKind: ITLibMediaItemMediaKindStub = .kindUnknown,
        modifiedDate: Date? = nil,
        playCount: Int = 0,
        playStatus: ITLibMediaItemPlayStatusStub = .none,
        rating: Int = 0,
        releaseDate: Date? = nil,
        sampleRate: Int = 0,
        skipCount: Int = 0,
        skipDate: Date? = nil,
        sortComposer: String? = nil,
        sortTitle: String? = nil,
        startTime: Int = 0,
        stopTime: Int = 0,
        title: String = "",
        totalTime: Int = 0,
        trackNumber: Int = 0,
        videoInfo: ITLibMediaItemVideoInfoStub? = nil,
        voiceOverLanguage: String? = nil,
        volumeAdjustment: Int = 0,
        volumeNormalizationEnergy: Int = 0,
        year: Int = 0
    ) {
        self.addedDateProperty = addedDateProperty
        self.album = album
        self.artist = artist
        self.artwork = artwork
        self.beatsPerMinute = beatsPerMinute
        self.bitrate = bitrate
        self.category = category
        self.comments = comments
        self.composer = composer
        self.contentRating = contentRating
        self.description = description
        self.fileSize = fileSize
        self.genre = genre
        self.grouping = grouping
        self.hasArtworkAvailable = hasArtworkAvailable
        self.isCloud = isCloud
        self.isDRMProtected = isDRMProtected
        self.isPurchased = isPurchased
        self.isRatingComputed = isRatingComputed
        self.isUserDisabled = isUserDisabled
        self.isVideo = isVideo
        self.kind = kind
        self.lastPlayedDate = lastPlayedDate
        self.location = location
        self.locationType = locationType
        self.lyricsContentRating = lyricsContentRating
        self.mediaKind = mediaKind
        self.modifiedDate = modifiedDate
        self.playCount = playCount
        self.playStatus = playStatus
        self.rating = rating
        self.releaseDate = releaseDate
        self.sampleRate = sampleRate
        self.skipCount = skipCount
        self.skipDate = skipDate
        self.sortComposer = sortComposer
        self.sortTitle = sortTitle
        self.startTime = startTime
        self.stopTime = stopTime
        self.title = title
        self.totalTime = totalTime
        self.trackNumber = trackNumber
        self.videoInfo = videoInfo
        self.voiceOverLanguage = voiceOverLanguage
        self.volumeAdjustment = volumeAdjustment
        self.volumeNormalizationEnergy = volumeNormalizationEnergy
        self.year = year
    }

    public init<T: ITLibMediaItemProtocol>(_ t: T) where
        T.Artwork.ArtworkFormat == ITLibArtworkFormat,
        T.MediaItemLocationType == ITLibMediaItemLocationType,
        T.MediaItemLyricsContentRating == ITLibMediaItemLyricsContentRating,
        T.MediaItemMediaKind == ITLibMediaItemMediaKind,
        T.MediaItemPlayStatus == ITLibMediaItemPlayStatus
    {
        self.init(
            addedDateProperty: t.addedDateProperty,
            album: ITLibAlbumStub(t.album),
            artist: t.artist.map(ITLibArtistStub.init),
            artwork: t.artwork.map(ITLibArtworkStub.init),
            beatsPerMinute: t.beatsPerMinute,
            bitrate: t.bitrate,
            category: t.category,
            comments: t.comments,
            composer: t.composer,
            contentRating: t.contentRating,
            description: t.description,
            fileSize: t.fileSize,
            genre: t.genre,
            grouping: t.grouping,
            hasArtworkAvailable: t.hasArtworkAvailable,
            isCloud: t.isCloud,
            isDRMProtected: t.isDRMProtected,
            isPurchased: t.isPurchased,
            isRatingComputed: t.isRatingComputed,
            isUserDisabled: t.isUserDisabled,
            isVideo: t.isVideo,
            kind: t.kind,
            lastPlayedDate: t.lastPlayedDate,
            location: t.location,
            locationType: ITLibMediaItemLocationTypeStub(t.locationType),
            lyricsContentRating: ITLibMediaItemLyricsContentRatingStub(t.lyricsContentRating),
            mediaKind: ITLibMediaItemMediaKindStub(t.mediaKind),
            modifiedDate: t.modifiedDate,
            playCount: t.playCount,
            playStatus: ITLibMediaItemPlayStatusStub(t.playStatus),
            rating: t.rating,
            releaseDate: t.releaseDate,
            sampleRate: t.sampleRate,
            skipCount: t.skipCount,
            skipDate: t.skipDate,
            sortComposer: t.sortComposer,
            sortTitle: t.sortTitle,
            startTime: t.startTime,
            stopTime: t.stopTime,
            title: t.title,
            totalTime: t.totalTime,
            trackNumber: t.trackNumber,
            videoInfo: t.videoInfo.map(ITLibMediaItemVideoInfoStub.init),
            voiceOverLanguage: t.voiceOverLanguage,
            volumeAdjustment: t.volumeAdjustment,
            volumeNormalizationEnergy: t.volumeNormalizationEnergy,
            year: t.year
        )
    }

    public var addedDateProperty: Date?
    public var album: ITLibAlbumStub
    public var artist: ITLibArtistStub?
    public var artwork: ITLibArtworkStub?
    public var beatsPerMinute: Int
    public var bitrate: Int
    public var category: String?
    public var comments: String?
    public var composer: String
    public var contentRating: String?
    public var description: String?
    public var fileSize: UInt64
    public var genre: String
    public var grouping: String?
    public var hasArtworkAvailable: Bool
    public var isCloud: Bool
    public var isDRMProtected: Bool
    public var isPurchased: Bool
    public var isRatingComputed: Bool
    public var isUserDisabled: Bool
    public var isVideo: Bool
    public var kind: String?
    public var lastPlayedDate: Date?
    public var location: URL?
    public var locationType: ITLibMediaItemLocationTypeStub
    public var lyricsContentRating: ITLibMediaItemLyricsContentRatingStub
    public var mediaKind: ITLibMediaItemMediaKindStub
    public var modifiedDate: Date?
    public var playCount: Int
    public var playStatus: ITLibMediaItemPlayStatusStub
    public var rating: Int
    public var releaseDate: Date?
    public var sampleRate: Int
    public var skipCount: Int
    public var skipDate: Date?
    public var sortComposer: String?
    public var sortTitle: String?
    public var startTime: Int
    public var stopTime: Int
    public var title: String
    public var totalTime: Int
    public var trackNumber: Int
    public var videoInfo: ITLibMediaItemVideoInfoStub?
    public var voiceOverLanguage: String?
    public var volumeAdjustment: Int
    public var volumeNormalizationEnergy: Int
    public var year: Int 
}
