import Foundation

struct PokeDex: Codable {
    var results: [PokemonList]
    
    enum CodingKeys: String, CodingKey {
        case results
    }

    struct PokemonList: Codable {
        var name: String
        var url: String
        
        enum CodingKeys: String, CodingKey {
            case name
            case url
        }
    }
}
