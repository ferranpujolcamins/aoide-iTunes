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

public protocol ITLibMediaItemMediaKindProtocol: Equatable {
    static func kindUnknown() -> Self
    static func kindSong() -> Self
    static func kindMovie() -> Self
    static func kindPodcast() -> Self
    static func kindAudiobook() -> Self
    static func kindPDFBooklet() -> Self
    static func kindMusicVideo() -> Self
    static func kindTVShow() -> Self
    static func kindInteractiveBooklet() -> Self
    static func kindHomeVideo() -> Self
    static func kindRingtone() -> Self
    static func kindDigitalBooklet() -> Self
    static func kindIOSApplication() -> Self
    static func kindVoiceMemo() -> Self
    static func kindiTunesU() -> Self
    static func kindBook() -> Self
    static func kindPDFBook() -> Self
    static func kindAlertTone() -> Self
}

extension ITLibMediaItemMediaKind: ITLibMediaItemMediaKindProtocol {
    public static func kindUnknown() -> Self { .kindUnknown }
    public static func kindSong() -> Self { .kindSong }
    public static func kindMovie() -> Self { .kindMovie }
    public static func kindPodcast() -> Self { .kindPodcast }
    public static func kindAudiobook() -> Self { .kindAudiobook }
    public static func kindPDFBooklet() -> Self { .kindPDFBooklet }
    public static func kindMusicVideo() -> Self { .kindMusicVideo }
    public static func kindTVShow() -> Self { .kindTVShow }
    public static func kindInteractiveBooklet() -> Self { .kindInteractiveBooklet }
    public static func kindHomeVideo() -> Self { .kindHomeVideo }
    public static func kindRingtone() -> Self { .kindRingtone }
    public static func kindDigitalBooklet() -> Self { .kindDigitalBooklet }
    public static func kindIOSApplication() -> Self { .kindIOSApplication }
    public static func kindVoiceMemo() -> Self { .kindVoiceMemo }
    public static func kindiTunesU() -> Self { .kindiTunesU }
    public static func kindBook() -> Self { .kindBook }
    public static func kindPDFBook() -> Self { .kindPDFBook }
    public static func kindAlertTone() -> Self { .kindAlertTone }
}
