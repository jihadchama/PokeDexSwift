import Reusable
import UIKit

class PokemonListCollectionViewCell: UICollectionViewCell, Reusable, ViewCode {
    private let pokedexCard = PokedexCard()
    
    func addSubviews() {
        contentView.addSubview(pokedexCard)
    }
    
    func setupConstraints() {
        pokedexCard.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func render(pokemon: PokemonViewModel) {
        pokedexCard.render(pokemon)
        setupView()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        contentView.removeAllSubViews()
    }
}
