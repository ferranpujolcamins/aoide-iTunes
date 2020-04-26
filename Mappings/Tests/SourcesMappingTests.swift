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

import XCTest
import ITunesModelStubs
import AoideModel
import Mappings

final class SourcesMappingTests: XCTestCase {

    func testSourcesAreMapped() {
        // Given a media item with an uri, totalTime, sampleRate and bitrate
        var mediaItem = ITLibMediaItemStub()
        mediaItem.location = URL(string: "file:///home/user/music/sickTune.mp3")
        mediaItem.totalTime = 230
        mediaItem.sampleRate = 44100
        mediaItem.bitrate = 320000

        // When we map the media item to the aoide model with a given mime type
        let aoideTrack = mediaItem.mapToAoide(mimeType: "audio/mpeg")

        // Then the uri, mime type, totalTime, sampleRate and bitrate are mapped
        XCTAssertEqual(
            aoideTrack.media_sources,
            [Source(
                uri: "file:///home/user/music/sickTune.mp3",
                content_type: "audio/mpeg",
                content: .audio(AudioContent(
                    channels: .layout(.stereo),
                    duration: 230,
                    sample_rate: 44100,
                    bit_rate: 320000,
                    loudness: nil,
                    encoder: nil
                ))
            )]
        )
    }
}
