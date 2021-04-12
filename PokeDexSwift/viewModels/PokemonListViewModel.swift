import Alamofire
import Combine
import Foundation

struct PokeAPIURL {
    static let pokemonListURL = "https://pokeapi.co/api/v2/pokemon?limit=151"
}

class PokemonListViewModel: ObservableObject {
    @Published private(set) var pokemons = [Pokemon]()
    
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
    
    func fetchSortedData() {
        requestPokeDex { pokedex in
            self.requestPokemon(pokeDex: pokedex) { [weak self] pokemons in
                self?.pokemons = pokemons.sorted(by: {
                    $0.id < $1.id
                })
            }
        }
    }
}


