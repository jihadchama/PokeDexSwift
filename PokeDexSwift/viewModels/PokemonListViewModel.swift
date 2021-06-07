import Combine

class PokemonListViewModel: ObservableObject {
    @Published private(set) var pokemons = [Pokemon]()
    private(set) var pokeDex: PokeDex!
    let client = PokeDexClient()
    
    fileprivate func fetchAndSortPokemons(_ pokedex: PokeDex) {
        client.requestPokemon(pokeDex: pokedex) { [weak self] pokemons in
            pokemons.sorted(by: {
                $0.id < $1.id
            }).forEach({ pokemon in
                self?.pokemons.append(pokemon)
            })
        }
    }
    
    func requestPokeDex() {
        client.requestPokeDex(url: PokeAPIURL.pokemonListURL) { pokedex in
            self.pokeDex = pokedex
            self.fetchAndSortPokemons(pokedex)
        }
    }
    
    func requestNextPage() {
        client.requestPokeDex(url: pokeDex.next) { pokedex in
            self.pokeDex = pokedex
            self.fetchAndSortPokemons(pokedex)
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
