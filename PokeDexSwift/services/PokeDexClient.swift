import Alamofire
import Foundation

struct PokeAPIURL {
    static let pokemonListURL = "https://pokeapi.co/api/v2/pokemon?limit=151"
}

class PokeDexClient {    
    func requestPokeDex(success: @escaping (PokeDex) -> Void) {
        AF.request(PokeAPIURL.pokemonListURL)
            .validate()
            .responseDecodable(of: PokeDex.self) { response in
                if let value = response.value {
                    success(value)
                }
            }
    }
    
    func requestPokemon(pokeDex: PokeDex, completion: @escaping ([Pokemon]) -> Void) {
        var pokemons: [Pokemon] = []
        let fetchGroup = DispatchGroup()
        pokeDex.results.forEach { pokemon in
            fetchGroup.enter()
            AF.request(pokemon.url)
                .validate()
                .responseDecodable(of: Pokemon.self) { response in
                    if let value = response.value {
                        pokemons.append(value)
                    }
                    fetchGroup.leave()
                }
        }
        fetchGroup.notify(queue: .main) {
            completion(pokemons)
        }
    }
}
