import UIKit

class PokemonViewController: UIViewController {
    private let pokemonCard = PokemonCard(frame: UIScreen.main.bounds)
    private var pokemon: PokemonViewModel
    
    init(pokemon: PokemonViewModel) {
        self.pokemon = pokemon
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(pokemonCard)
        pokemonCard.render(pokemon)
    }
}
