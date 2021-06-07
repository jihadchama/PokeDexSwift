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
    
    var imageURL: String {
        "https://pokeres.bastionbot.org/images/pokemon/\(pokemon.id).png"
    }
    
    var stats: [Stats] {
        pokemon.stats
    }
}
