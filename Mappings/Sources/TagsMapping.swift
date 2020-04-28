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
import ITunesModel

public let reservedFacetMixxxOrg = "mixxx.org"
public let ratingLabel = "rating"
public let genreFacet = "genre"
public let commentFacet = "comment"

extension ITLibMediaItemProtocol {

    func tags() -> Tags {
        Dictionary([
            genreTag(),
            groupingTag(),
            ratingTag(),
            commentsTag()
        ], uniquingKeysWith: +)
    }

    func genreTag() -> (String, [PlainTag]) {
        let trimmedGenre = genre.trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedGenre.count > 0 else { return (genreFacet, [] ) }

        return (genreFacet, [PlainTag(label: trimmedGenre, score: 1)])
    }

    func groupingTag() -> (String, [PlainTag]) {
        let trimmedGrouping = (grouping ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedGrouping.count > 0 else { return (genreFacet, [] ) }

        return (genreFacet, [PlainTag(label: trimmedGrouping, score: 0.5)])
    }

    func ratingTag() -> (String, [PlainTag]) {
        guard rating > 0 else { return (reservedFacetMixxxOrg, [] )}

        let score = min(1, Float64(rating) / Float64(maxRating))
        return (reservedFacetMixxxOrg, [PlainTag(label: ratingLabel, score: score)])
    }

    func commentsTag() -> (String, [PlainTag]) {
        let trimmedComments = (comments ?? "").trimmingCharacters(in: .whitespacesAndNewlines)
        guard trimmedComments.count > 0 else { return (reservedFacetMixxxOrg, []) }

        return (commentFacet, [PlainTag(label: trimmedComments, score: 1)])
    }
}
