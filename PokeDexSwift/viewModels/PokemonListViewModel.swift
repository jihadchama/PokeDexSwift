import Combine

class PokemonListViewModel: ObservableObject {
    @Published private(set) var pokemons = [Pokemon]()
    let client = PokeDexClient()
    
    func fetchAndSortPokemons() {
        client.requestPokeDex { pokedex in
            self.client.requestPokemon(pokeDex: pokedex) { [weak self] pokemons in
                self?.pokemons = pokemons.sorted(by: {
                    $0.id < $1.id
                })
            }
        }
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return pokemons.count
    }
    
    func pokemonAtIndex(_ index: Int) -> PokemonViewModel {
        let pokemon = pokemons[index]
        return PokemonViewModel(pokemon)
    }
}

struct PokemonViewModel {
    private let pokemon: Pokemon
    
    init(_ pokemon: Pokemon) {
        self.pokemon = pokemon
    }
    
    var name: String {
        pokemon.name
    }
    
    var type1: Pokemon.PokemonType? {
        pokemon.types[0].type
    }
    
    var type2: Pokemon.PokemonType? {
        if pokemon.types.count > 1 {
            return pokemon.types[1].type
        } else {
            return nil
        }
    }
    
    var id: String {
        pokemon.id.description
    }
}

