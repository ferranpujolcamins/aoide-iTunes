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
    public func tracks() -> IOWriter<[Track]> {
        let response = IOWriter<(response: URLResponse, data: Data)>.var()
        let parsedResponse = IOWriter<[Track]>.var()

        return binding(
            response <- IOWriter.liftF(URLSession.shared.dataTaskIO(with: URL(string: self.tracksUrl)!)),
            |<-IOWriter.tell([.requestSuccesful(method: "GET", url: self.tracksUrl)]),
            parsedResponse <- IOWriter.liftF(response.get.data.decode([Track].self)),
            |<-IOWriter.tell([.successfullyParsed(method: "GET", url: self.tracksUrl)]),
            yield: parsedResponse.get
        )^
    }

    var replaceUrl: String { "\(baseUrl)/replace" }
    public func replace(_ tracks: [Track]) -> IOWriter<Void> {

        let dto = ReplaceTracksDTO(
            mode: .updateOrCreate,
            replacements: tracks.compactMap(Replacement.init)
        )

        let uploadData = try! JSONEncoder().encode(dto)
        let uploadDataJson = String(data: uploadData, encoding: .utf8) ?? ""

        var request = URLRequest(url: URL(string: replaceUrl)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")

        return binding(
            |<-IOWriter.tell([.requestBody(uploadDataJson)]),
            |<-IOWriter.liftF(URLSession.shared.uploadTaskIO(with: request, from: uploadData)),
            |<-IOWriter.tell([.requestSuccesful(method: "POST", url: self.replaceUrl)]),
            yield: ()
        )^
    }

    private struct ReplaceTracksDTO: Codable {
        let mode: Mode
        let replacements: [Replacement]
    }

    private struct Replacement: Codable {
        let mediaUri: String
        let track: Track

        init?(_ track: Track) {
            guard let uri = track.rel.first?.uri else { return nil }
            self.mediaUri = uri
            self.track = track
        }
    }

    private enum Mode: String, Codable {
        case updateOnly = "update-only"
        case updateOrCreate = "update-or-create"
    }
}
