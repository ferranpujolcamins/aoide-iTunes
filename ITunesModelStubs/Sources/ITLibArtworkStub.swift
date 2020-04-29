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

import AppKit
import iTunesLibrary
import ITunesModel

public struct ITLibArtworkStub: ITLibArtworkProtocol {

    public init(image: NSImage? = nil, imageData: Data? = nil, imageDataFormat: ITLibArtworkFormatStub = .none) {
        self.image = image
        self.imageData = imageData
        self.imageDataFormat = imageDataFormat
    }

    public init<T: ITLibArtworkProtocol>(_ t: T) where T.ArtworkFormat == ITLibArtworkFormat {
        self.init(
            image: t.image,
            imageData: t.imageData,
            imageDataFormat: ITLibArtworkFormatStub(t.imageDataFormat)
        )
    }

    public var image: NSImage?

    public var imageData: Data?

    public var imageDataFormat: ITLibArtworkFormatStub
}

public enum ITLibArtworkFormatStub: UInt, Codable {

    public init(_ t: ITLibArtworkFormat) {
        switch t {
        case .none: self = .none
        case .bitmap: self = .bitmap
        case .JPEG: self = .JPEG
        case .JPEG2000: self = .JPEG2000
        case .GIF: self = .GIF
        case .PNG: self = .PNG
        case .BMP: self = .BMP
        case .TIFF: self = .TIFF
        case .PICT: self = .PICT
        @unknown default: self = .none
        }
    }

    case none = 0

    case bitmap = 1

    case JPEG = 2

    case JPEG2000 = 3

    case GIF = 4

    case PNG = 5

    case BMP = 6

    case TIFF = 7

    case PICT = 8
}

extension ITLibArtworkStub: Codable {
    enum CodingKeys: String, CodingKey {
        case imageData
        case imageDataFormat
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.imageData = try container.decode(Data.self, forKey: .imageData)
        self.imageDataFormat = try container.decode(ITLibArtworkFormatStub.self, forKey: .imageDataFormat)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        if let imageData = imageData {
            try container.encodeIfPresent(imageData, forKey: .imageData)
            try container.encode(imageDataFormat, forKey: .imageDataFormat)
        } else if let image = image {
            let data = image.tiffRepresentation
            try container.encodeIfPresent(data, forKey: .imageData)
            try container.encode(ITLibArtworkFormatStub.TIFF, forKey: .imageDataFormat)
        } else {
            throw ITunesModelStubsError.errorEncodingArtwork
        }
    }
}
