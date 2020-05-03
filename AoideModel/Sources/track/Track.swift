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

public struct Track: Equatable, Codable {
    public init(
        media_sources: [Source],
        release: Release?,
        album: Album?,
        titles: [Title],
        actors: [Actor],
        indexes: Indexes,
        markers: Markers,
        tags: Tags
    ) {
        self.media_sources = media_sources
        self.release = release
        self.album = album
        self.titles = titles
        self.actors = actors
        self.indexes = indexes
        self.markers = markers
        self.tags = tags
    }

//    public let collections: [Collection]

    public let media_sources: [Source]

    public let release: Release?

    public let album: Album?

    public let titles: [Title]

    public let actors: [Actor]

    public let indexes: Indexes

    public let markers: Markers

    public let tags: Tags
}
