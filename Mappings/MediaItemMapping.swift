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
import AoideModel
import ITunesModel

extension ITLibMediaItemProtocol {

    public func mapToAoide(mimeType: String) -> Track {
        Track(
            media_sources: sources(mimeType: mimeType),
            release: release(),
            album: album.mapToAoide(),
            titles: titles(),
            actors: actors(),
            indexes: indexes(),
            markers: markers(),
            tags: tags()
        )
    }

    func sources(mimeType: String) -> [Source] {
        [Source(
            uri: location!.absoluteString,
            content_type: mimeType,
            content: .audio(audioContent())
        )]
    }

    func release() -> Release {
        Release(
            releasedAt: releaseDate.map(ReleasedAt.dateTime)
                ?? validate(year, { $0 != 0 })
                    .flatMap(ReleaseYear.init(exactly:))
                    .map { ReleasedAt.date(.fromYear($0)) },
            releasedBy: nil,
            copyright: nil,
            licenses: []
        )
    }

    func titles() -> [Title] {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        let trimmedSortTitle = sortTitle?.trimmingCharacters(in: .whitespacesAndNewlines)

        return Optional.first([
                validate(trimmedTitle, { !$0.isEmpty }),
                validate(trimmedSortTitle, { !$0.isEmpty })
            ])
            .map(Title.default)
            .map(Array.pure)
            ?? []
    }

    func audioContent() -> AudioContent {
        AudioContent(
            channels: .layout(.stereo),
            duration: Double(totalTime),
            sample_rate: UInt32(sampleRate),
            bit_rate: UInt32(bitrate),
            loudness: nil,
            encoder: nil
        )
    }

    func indexes() -> Indexes {
        Indexes(
            disc: validate(
                Index(number: UInt16(album.discNumber), total: UInt16(album.discCount)),
                { $0.number > 0 || $0.total > 0}
            ),
            track: validate(
                Index(number: UInt16(trackNumber), total: UInt16(album.trackCount)),
                { $0.number > 0 || $0.total > 0}
            ),
            movement: nil
        )
    }
}
