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

public protocol ITLibMediaItemVideoInfoProtocol {

    var series: String? { get }

    var sortSeries: String? { get }

    var season: Int { get }

    var episode: String? { get }

    var episodeOrder: Int { get }

    var isHD: Bool { get }

    var videoWidth: Int { get }

    var videoHeight: Int { get }
}

extension ITLibMediaItemVideoInfo: ITLibMediaItemVideoInfoProtocol {}
