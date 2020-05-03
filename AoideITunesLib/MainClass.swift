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
import Bow
import BowEffects
import ITunesModel
import Mappings
import AoideClient

public func buildMain() -> Main<ITLibrary> {
    Main<ITLibrary>(
        itunesLibrary: try! ITLibrary(apiVersion: "1.0"),
        aoideClient: AoideClient(baseUrl: "http://localhost:8080")
    )
}

public class Main<ITunesLibrary: ITLibraryProtocol> {

    internal init(itunesLibrary: ITunesLibrary, aoideClient: AoideAPI) {
        self.itunesLibrary = itunesLibrary
        self.aoideClient = aoideClient
    }

    let itunesLibrary: ITunesLibrary
    let aoideClient: AoideAPI

    public func run() -> IO<Error, Void> {
        let tracks = itunesLibrary.allMediaItems
            .filter { mediaItem -> Bool in
                !mediaItem.isUserDisabled
                    && !mediaItem.isVideo
                    && mediaItem.mediaKind == .kindSong()
            }
            .map { $0.mapToAoide(mimeType: "") }

        return aoideClient.tracks.replace(tracks)
    }
}
