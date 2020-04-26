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

public struct Source: Equatable {

    public init(uri: String, content_type: String, content: Content) {
        
        self.uri = uri
        self.contentType = content_type
        self.content = content
    }

    
    public let uri: String

    // The content_type uniquely identifies a Source of
    // a Track, i.e. no duplicate content types are allowed
    // among the track sources of each track.
    public let contentType: String

    public let content: Content

//    public let artwork: Artwork?
}

public enum Content: Equatable {
    case audio(AudioContent)
}
