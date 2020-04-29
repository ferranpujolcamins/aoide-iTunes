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

public enum ITLibMediaItemMediaKindStub: String, Codable {

    public init(_ t: ITLibMediaItemMediaKind) {
        switch t {
        case .kindUnknown: self = .kindUnknown
        case .kindSong: self = .kindSong
        case .kindMovie: self = .kindMovie
        case .kindPodcast: self = .kindPodcast
        case .kindAudiobook: self = .kindAudiobook
        case .kindPDFBooklet: self = .kindPDFBooklet
        case .kindMusicVideo: self = .kindMusicVideo
        case .kindTVShow: self = .kindTVShow
        case .kindInteractiveBooklet: self = .kindInteractiveBooklet
        case .kindHomeVideo: self = .kindHomeVideo
        case .kindRingtone: self = .kindRingtone
        case .kindDigitalBooklet: self = .kindDigitalBooklet
        case .kindIOSApplication: self = .kindIOSApplication
        case .kindVoiceMemo: self = .kindVoiceMemo
        case .kindiTunesU: self = .kindiTunesU
        case .kindBook: self = .kindBook
        case .kindPDFBook: self = .kindPDFBook
        case .kindAlertTone: self = .kindAlertTone
        @unknown default: self = .kindUnknown
        }
    }

    case kindUnknown

    case kindSong

    case kindMovie
    
    case kindPodcast

    case kindAudiobook

    case kindPDFBooklet

    case kindMusicVideo

    case kindTVShow

    case kindInteractiveBooklet

    case kindHomeVideo

    case kindRingtone

    case kindDigitalBooklet

    case kindIOSApplication

    case kindVoiceMemo

    case kindiTunesU

    case kindBook

    case kindPDFBook

    case kindAlertTone
}
