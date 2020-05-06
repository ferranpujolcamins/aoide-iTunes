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

public struct TrackDTO: Equatable, Codable {
    internal init(
        src: [Source],
        rel: Release?,
        alb: Album?,
        tit: [Title],
        act: [Actor],
        idx: Indexes,
        mrk: Markers,
        tag: Tags
    ) {
        self.src = src
        self.rel = rel
        self.alb = alb
        self.tit = tit
        self.act = act
        self.idx = idx
        self.mrk = mrk
        self.tag = tag
    }

    //    public let col: [Collection]

    public let src: [Source]

    public let rel: Release?

    public let alb: Album?

    public let tit: [Title]

    public let act: [Actor]

    public let idx: Indexes

    public let mrk: Markers

    public let tag: Tags
}

extension TrackDTO {
    public func model() -> Track {
        Track(
            media_sources: src,
            release: rel,
            album: alb,
            titles: tit,
            actors: act,
            indexes: idx,
            markers: mrk,
            tags: tag
            )
    }
}

extension Track {
    public func dto() -> TrackDTO {
        TrackDTO(
            src: media_sources,
            rel: release,
            alb: album,
            tit: titles,
            act: actors,
            idx: indexes,
            mrk: markers,
            tag: tags
        )
    }
}
