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
import ITunesModel

public struct ITLibArtworkStub: ITLibArtworkProtocol {

    public var image: NSImage? = nil

    public var imageData: Data? = nil

    public var imageDataFormat: ITLibArtworkFormatStub = .none
}

public enum ITLibArtworkFormatStub : UInt {

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
