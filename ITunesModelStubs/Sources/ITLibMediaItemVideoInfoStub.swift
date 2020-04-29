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
import ITunesModel

public struct ITLibMediaItemVideoInfoStub: ITLibMediaItemVideoInfoProtocol {

    public init(
        series: String? = nil,
        sortSeries: String? = nil,
        season: Int = 0,
        episode: String? = nil,
        episodeOrder: Int = 0,
        isHD: Bool = false,
        videoWidth: Int = 0,
        videoHeight: Int = 0
    ) {
        self.series = series
        self.sortSeries = sortSeries
        self.season = season
        self.episode = episode
        self.episodeOrder = episodeOrder
        self.isHD = isHD
        self.videoWidth = videoWidth
        self.videoHeight = videoHeight
    }

    public init<T: ITLibMediaItemVideoInfoProtocol>(_ t: T) {
        self.init(
            series: t.series,
            sortSeries: t.sortSeries,
            season: t.season,
            episode: t.episode,
            episodeOrder: t.episodeOrder,
            isHD: t.isHD,
            videoWidth: t.videoWidth,
            videoHeight: t.videoHeight
        )
    }

    public var series: String?

    public var sortSeries: String?

    public var season: Int

    public var episode: String?

    public var episodeOrder: Int

    public var isHD: Bool

    public var videoWidth: Int

    public var videoHeight: Int
}
