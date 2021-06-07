import UIKit

struct SetupColors {
    static func setupBackgroundColor(pokemonType: Pokemon.PokemonType) -> UIColor {
        switch pokemonType.name {
        case "bug":
            return PokemonColors.bug.background
        case "grass":
            return PokemonColors.grass.background
        case "water":
            return PokemonColors.water.background
        case "ice":
            return PokemonColors.ice.background
        case "ground":
            return PokemonColors.ground.background
        case "ghost":
            return PokemonColors.ghost.background
        case "fire":
            return PokemonColors.fire.background
        case "electric":
            return PokemonColors.electric.background
        case "normal":
            return PokemonColors.normal.background
        case "fairy":
            return PokemonColors.fairy.background
        case "rock":
            return PokemonColors.rock.background
        case "fighting":
            return PokemonColors.fighting.background
        case "dragon":
            return PokemonColors.dragon.background
        case "psychic":
            return PokemonColors.psychic.background
        case "poison":
            return PokemonColors.poison.background
        case "dark":
            return PokemonColors.dark.background
        case "steel":
            return PokemonColors.steel.background
        case "flying":
            return PokemonColors.flying.background
        default:
            return .black
        }
    }
    
    static func setupTypeBackgroundColor(pokemonType: Pokemon.PokemonType) -> UIColor {
        switch pokemonType.name {
        case "bug":
            return PokemonColors.bug.type
        case "grass":
            return PokemonColors.grass.type
        case "water":
            return PokemonColors.water.type
        case "ice":
            return PokemonColors.ice.type
        case "ground":
            return PokemonColors.ground.type
        case "ghost":
            return PokemonColors.ghost.type
        case "fire":
            return PokemonColors.fire.type
        case "electric":
            return PokemonColors.electric.type
        case "normal":
            return PokemonColors.normal.type
        case "fairy":
            return PokemonColors.fairy.type
        case "rock":
            return PokemonColors.rock.type
        case "fighting":
            return PokemonColors.fighting.type
        case "dragon":
            return PokemonColors.dragon.type
        case "psychic":
            return PokemonColors.psychic.type
        case "poison":
            return PokemonColors.poison.type
        case "steel":
            return PokemonColors.steel.type
        case "dark":
            return PokemonColors.dark.type
        case "flying":
            return PokemonColors.flying.type
        default:
            return .black
        }
    }
}
