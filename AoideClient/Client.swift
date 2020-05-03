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
import Bow
import BowEffects

public class AoideClient: AoideAPI {

    public init(baseUrl: String) {
        self.baseUrl = baseUrl
        tracks = TracksClient(baseUrl: "\(baseUrl)/tracks")
    }

    let baseUrl: String

    public var tracks: TracksAPI
}

public class TracksClient: TracksAPI {

    public init(baseUrl: String) {
        self.baseUrl = baseUrl
    }

    let baseUrl: String

    var tracksUrl: String { baseUrl }
    public func tracks() -> IO<Error, [Track]> {
        URLSession.shared.dataTaskIO(with: URL(string: tracksUrl)!)
            .flatMap { $0.data.decode([Track].self) }^
    }

    var replaceUrl: String { "\(baseUrl)/replace" }
    public func replace(_ tracks: [Track]) -> IO<Error, Void> {
        let tracksWithURI = tracks.filter { $0.media_sources.first?.uri != "" }

        let uploadData = try! JSONEncoder().encode(tracksWithURI)

        var request = URLRequest(url: URL(string: replaceUrl)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return URLSession.shared.uploadTaskIO(with: request, from: uploadData)
            .map { _ in () }^
    }
}
