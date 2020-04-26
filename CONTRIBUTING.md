Open the `Package.swift` file with Xcode.

The protocols in the `ITunesModel` package exist because the classes in `iTunesLibrary`
have read-only stored properties, and thus we cannot create subclasses were the properties
can be set to an arbitrary value to use in tests.

# Mapping of ITLibMediaItem to Track

✅ Mapped to `titles`

    /** @abstract The title of this media item. May be empty. */
    open var title: String { get }

✅ Mapped to `titles` if title is empty

    /** @abstract The title of this media item that should be used for sorting purposes.  If nil, use the title field. */
    open var sortTitle: String? { get }

✅ Mapped to `actors`

    /** @abstract The artist associated with this media item. */
    open var artist: ITLibArtist? { get }

✅ Mapped to `actors`

    /** @abstract The name of the composer associated with this media item.  May be empty. */
    open var composer: String { get }

✅ Mapped to `actors` if composer is empty

    /** @abstract The name of the composer associated with this media item that should be used for sorting purposes. If nil, use the composer field. */
    open var sortComposer: String? { get }

✅ Mapped to `tags`

    /** @abstract The rating of this media item. */
    open var rating: Int { get }

❌ Not mapped

    /** @abstract Whether this media item's rating is computed. */
    open var isRatingComputed: Bool { get }

✅ Mapped to `markers`(Position marker)

    /** @abstract If non-zero, the actual time playback for this media item will start instead of 0:00 (in milliseconds). */
    open var startTime: Int { get }

✅ Mapped to `markers`(Position marker)

    /** @abstract If non-zero, the actual time playback for this media item will stop vs. the total time (in milliseconds). */
    open var stopTime: Int { get }

✅ Mapped to `album` and `indexes`

    /** @abstract The album where this media item belongs. */
    open var album: ITLibAlbum { get }

✅ Mapped to `tags`

    /** @abstract The genre associated with this media item. May be empty. */
    open var genre: String { get }


    /** @abstract This media item's file kind (ex. MPEG audio file). */
    open var kind: String? { get }


    /** @abstract This media item's media kind. */
    open var mediaKind: ITLibMediaItemMediaKind { get }


    /** @abstract The size in bytes of this media item on disk. */
    open var fileSize: UInt64 { get }

❌ Not mapped

    /** @abstract The size in bytes of this media item on disk. (deprecated: use fileSize instead) */
    @available(*, deprecated)
    open var size: Int { get }


    /** @abstract The length of this media item in milliseconds. */
    open var totalTime: Int { get }

✅ Mapped to `indexes`

    /** @abstract The position of this media item within its album. */
    open var trackNumber: Int { get }

❌ Not mapped

    /** @abstract The podcast category of this media item (implies this media item is a podcast). */
    open var category: String? { get }

❌ Not mapped

    /** @abstract Any podcast description of with this media item (implies this media item is a podcast). */
    open var description: String? { get }

❌ Not mapped

    /** @abstract The content rating of this media item's lyrics. */
    open var lyricsContentRating: ITLibMediaItemLyricsContentRating { get }


    /** @abstract The extended content rating of this media item. */
    open var contentRating: String? { get }

❌ Not mapped

    /** @abstract The date and time this media item was last modified. */
    open var modifiedDate: Date? { get }

❌ Not mapped

    /** @abstract The date and media item this media item was added to the iTunes database. */
    open var addedDate: Date? { get }


    /** @abstract The bitrate of this media item in kbps. */
    open var bitrate: Int { get }


    /** @abstract The sample rate of this media item in samples per second. */
    open var sampleRate: Int { get }

✅ Mapped to `markers`(Beat marker)

    /** @abstract The BPM (beats per minute) of this media item. */
    open var beatsPerMinute: Int { get }

❌ Not mapped

    /** @abstract The number of times this media item has been played in iTunes. */
    open var playCount: Int { get }

❌ Not mapped

    /** @abstract The date and time this media item was last played in iTunes, or nil if this media item has not been played. */
    open var lastPlayedDate: Date? { get }

❌ Not mapped

    /** @abstract The play status for this media.  Represents partially played and unplayed states for videos and podcasts. Other media kinds always return "none". */
    open var playStatus: ITLibMediaItemPlayStatus { get } // added in 12.4


    /** @abstract The location of this media item on disk. */
    open var location: URL? { get }


    /** @abstract Whether this media item has artwork. */
    open var hasArtworkAvailable: Bool { get }


    /** @abstract Whether this media item has artwork. */
    open var artwork: ITLibArtwork? { get }

✅ Mapped to `tags`

    /** @abstract Any comments associated with this media item. */
    open var comments: String? { get }


    /** @abstract Whether this media item was purchased. */
    open var isPurchased: Bool { get }

❌ Not mapped

    /** @abstract Whether this media item is iTunes Match or iTunes in the Cloud. */
    open var isCloud: Bool { get }

❌ Not mapped

    /** @abstract Whether this media item is DRM protected. */
    open var isDRMProtected: Bool { get }

❌ Not mapped

    /** @abstract Whether this media item is a video media item (video podcast, movie, etc). */
    open var isVideo: Bool { get }

❌ Not mapped

    /** @abstract The video information of this media item (implies this media item is a video media item). */
    open var videoInfo: ITLibMediaItemVideoInfo? { get }

✅ Mapped to `release`

    /** @abstract The date this media item was released. */
    open var releaseDate: Date? { get }

✅ Mapped to `release` if releaseDate is nil

    /** @abstract The year when this media item was released. */
    open var year: Int { get }

❌ Not mapped

    /** @abstract The type of the file this media item refers to. */
    @available(*, deprecated)
    open var fileType: Int { get }

❌ Not mapped

    /** @abstract The number of times this media item has been skiped. */
    open var skipCount: Int { get }

❌ Not mapped

    /** @abstract The date and time when this media item was last skipped. */
    open var skipDate: Date? { get }

❌ Not mapped

    /** @abstract The voice-over language of this media item */
    open var voiceOverLanguage: String? { get }


    /** @abstract The volume adjustment used for this media item if any. */
    open var volumeAdjustment: Int { get }


    /** @abstract The volume normalization energy applied to this media item. */
    open var volumeNormalizationEnergy: Int { get }

❌ Not mapped

    /** @abstract Whether the user has disabled this media item. */
    open var isUserDisabled: Bool { get }


    /** @abstract The grouping of this media item. */
    open var grouping: String? { get }


    /** @abstract The type of this media item with respect to its location. */
    open var locationType: ITLibMediaItemLocationType { get }
