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
import Bow
import BowEffects
import ITunesModelStubs
import AoideClient
import AoideModel
@testable import AoideITunesLib

final class IntegrationTests: XCTestCase {

    let baseUrl = "http://localhost:8080"

    func testA() throws {
        var mediaItemStub = ITLibMediaItemStub()
        mediaItemStub.location = URL(string: "http://www.someplace.com/file.mp3")!
        mediaItemStub.totalTime = 60000
        mediaItemStub.year = 1999
        mediaItemStub.album.title = "Album Title"
        mediaItemStub.album.albumArtist = "Album Artist"
        mediaItemStub.album.discNumber = 1
        mediaItemStub.album.discCount = 2
        mediaItemStub.album.trackCount = 8
        mediaItemStub.trackNumber = 1
        mediaItemStub.title = "Title"
        mediaItemStub.artist = ITLibArtistStub(name: "Artist", persistentID: 0, sortName: "")
        mediaItemStub.composer = "Composer"
        mediaItemStub.mediaKind = .kindSong

        let iTunesLibraryStub = ITLibraryStub(allMediaItems: [
            mediaItemStub
        ])

        let tracksOracle = [
            Track(
                media_sources: [
                    Source(
                        uri: "http://www.someplace.com/file.mp3",
                        content_type: "???",
                        content: .audio(AudioContent(
                            channels: .count(2),
                            duration: 60000,
                            sample_rate: 0,
                            bit_rate: 0,
                            loudness: nil,
                            encoder: nil
                        ))
                    )
                ],
                release: Release(
                    releasedAt: .date(ReleaseDate(1999)),
                    releasedBy: nil,
                    copyright: nil,
                    licenses: []
                ),
                album: Album(
                    titles: [ .default(name: "Album title") ],
                    actors: [ Actor(name: "Album Artist", role: .artist, precedence: .default) ],
                    compilation: false
                ),
                titles: [
                    .default(name: "Title")
                ],
                actors: [
                    Actor(name: "Artist", role: .artist, precedence: .default),
                    Actor(name: "Composer", role: .composer, precedence: .default)
                ],
                indexes: Indexes(
                    disc: Index(number: 1, total: 2),
                    track: Index(number: 1, total: 8),
                    movement: nil
                ),
                markers: Markers(
                    positions: PositionMarkers(state: .readOnly, markers: [
                    ]),
                    beats: BeatMarkers(state: .readOnly, markers: [
                    ]),
                    keys: .empty
                ),
                tags: [:]
            )
        ]

        let main = Main(
            itunesLibrary: iTunesLibraryStub,
            aoideClient: AoideClient(baseUrl: baseUrl)
        )

        let testSucceeded = try main.run()
            .flatMap { [baseUrl] in AoideClient(baseUrl: baseUrl).tracks.tracks() }
            .map { dtoList in dtoList.map { $0.model() } }
            .map { $0 == tracksOracle }^
            .runT^
            .unsafeRunSync()

        testSucceeded.0.forEach { print($0) }
        XCTAssertTrue(testSucceeded.1)
    }
}
