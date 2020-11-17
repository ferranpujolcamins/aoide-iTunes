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

import XCTest
import AoideModel
import AoideModelDTO

final class ActorDTOTests: XCTestCase {

    func testModelToDTOMapping() {
        let model = Actor(name: "Name", role: .default, precedence: .default)
        let dto = model.dto()
        XCTAssertEqual(dto, ActorDTO.nameRolePrecedence("Name", .default, .default))
    }

    func testNameDTOtoModelMapping() {
        let dto = ActorDTO.name("Name")
        let model = dto.model()
        XCTAssertEqual(model, Actor(name: "Name", role: .default, precedence: .default))
    }

    func testNameRoleDTOtoModelMapping() {
        let dto = ActorDTO.nameRole("Name", .djMixer)
        let model = dto.model()
        XCTAssertEqual(model, Actor(name: "Name", role: .djMixer, precedence: .default))
    }

    func testNameRolePrecedenceDTOtoModelMapping() {
        let dto = ActorDTO.nameRolePrecedence("Name", .djMixer, .secondary)
        let model = dto.model()
        XCTAssertEqual(model, Actor(name: "Name", role: .djMixer, precedence: .secondary))
    }

    func testNameDTOSerialization() {
        let dto = ActorDTO.name("Name")
        let json = String(data: try! JSONEncoder().encode(dto), encoding: .utf8)
        XCTAssertEqual(json, "Name")
    }

    func testNameRoleDTOSerialization() {
        let dto = ActorDTO.nameRole("Name", .djMixer)
        let json = String(data: try! JSONEncoder().encode(dto), encoding: .utf8)
        XCTAssertEqual(json, """
            ["Name",4]
            """)
    }

    func testNameRolePrecedenceDTOSerialization() {
        let dto = ActorDTO.nameRolePrecedence("Name", .djMixer, .secondary)
        let json = String(data: try! JSONEncoder().encode(dto), encoding: .utf8)
        XCTAssertEqual(json, """
            ["Name",4,2]
            """)
    }

    func testNameDTODeserialization() {
        let json = """
            ["Name"]
            """
        let dto = try! JSONDecoder().decode([ActorDTO].self, from: json.data(using: .utf8)!)
        XCTAssertEqual(dto, [.name("Name")])
    }

    func testNameRoleDTODeserialization() {
        let json = """
            [["Name",4]]
            """
        let dto = try! JSONDecoder().decode([ActorDTO].self, from: json.data(using: .utf8)!)
        XCTAssertEqual(dto, [.nameRole("Name", .djMixer)])
    }

    func testNameRolePrecedenceDTODeserialization() {
        let json = """
            [["Name",4,2]]
            """
        let dto = try! JSONDecoder().decode([ActorDTO].self, from: json.data(using: .utf8)!)
        XCTAssertEqual(dto, [.nameRolePrecedence("Name", .djMixer, .secondary)])
    }
}
