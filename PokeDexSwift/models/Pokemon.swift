import Foundation

struct Pokemon: Codable {
    var id: Int
    var name: String
    var types: [Types]
    var stats: [Stats]

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case types
        case stats
    }
    
    struct Types: Codable {
        var type: PokemonType?

        enum CodingKeys: String, CodingKey {
            case type
        }
    }

    struct PokemonType: Codable {
        var name: String

        enum CodingKeys: String, CodingKey {
            case name
        }
    }
}
