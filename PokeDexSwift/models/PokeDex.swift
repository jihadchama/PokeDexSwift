import Foundation

struct PokeDex: Codable {
    var results: [PokemonList]
    var next: String
    
    enum CodingKeys: String, CodingKey {
        case results
        case next
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
