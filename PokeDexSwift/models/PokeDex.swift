import Foundation

struct PokeDex: Codable {
    var results: [PokemonList]
    var next: String
    
    struct PokemonList: Codable {
        var name: String
        var url: String
    }
}
