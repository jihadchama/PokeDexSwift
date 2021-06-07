import Reusable
import UIKit

class PokemonListCollectionViewCell: UICollectionViewCell, Reusable {
    func render(pokemon: PokemonViewModel) {
        let pokedexCard = PokedexCard(frame: contentView.bounds)
        pokedexCard.render(pokemon)
        contentView.addSubview(pokedexCard)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
