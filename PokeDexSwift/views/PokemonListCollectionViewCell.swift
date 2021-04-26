import Reusable
import UIKit

class PokemonListCollectionViewCell: UICollectionViewCell, Reusable {
    func render(pokemon: PokemonViewModel) {
        let pokemonCard = PokemonCard(frame: contentView.bounds)
        pokemonCard.render(pokemon)
        contentView.addSubview(pokemonCard)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
