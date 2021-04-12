import UIKit

class PokemonListCollectionViewCell: UICollectionViewCell {
    static let identifier = "PokemonCollectionViewCell"
    
    func render(pokemon: Pokemon) {
        let pokemonCard = PokemonCard(frame: contentView.bounds)
        pokemonCard.render(pokemon)
        contentView.addSubview(pokemonCard)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
