import Alamofire
import Foundation

struct PokeAPIURL {
    static let pokemonListURL = "https://pokeapi.co/api/v2/pokemon?limit=151"
}

class PokeDexClient {
    func requestPokeDex(success: @escaping (PokeDex) -> Void, failure: @escaping (AnyObject?, Int?, Error) -> Void) {
        AF.request(PokeAPIURL.pokemonListURL).responseData { data in
            switch data.result {
            case .success(let pokeList):
                if let pokeDex = try? JSONDecoder().decode(PokeDex.self, from: pokeList) {
                    success(pokeDex)
                }
            case .failure(let error):
                failure(nil, nil, error)
            }
        }
    }

    func requestPokemon(pokemonURL: String, success: @escaping (Pokemon) -> Void, failure: @escaping (AnyObject?, Int?, Error) -> Void) {
        AF.request(pokemonURL).responseData { data in
            switch data.result {
            case .success(let pokemonResult):
                if let pokemon = try? JSONDecoder().decode(Pokemon.self, from: pokemonResult) {
                    success(pokemon)
                }
            case .failure(let error):
                failure(nil, nil, error)
            }
        }
    }
}
