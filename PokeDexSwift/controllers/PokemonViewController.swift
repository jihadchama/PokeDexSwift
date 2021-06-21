import UIKit

class PokemonViewController: UIViewController, PokemonCardDelegate {
    private var pokemonViewModel: PokemonViewModel
    private let pokemonCard: PokemonCard
    
    init(pokemon: PokemonViewModel) {
        pokemonViewModel = pokemon
        
        pokemonCard = PokemonCard(frame: UIScreen.main.bounds,
                                  viewModel: pokemonViewModel)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        view.addSubview(pokemonCard)
        pokemonCard.delegate = self
        pokemonCard.render(pokemonViewModel)
    }
    
    func dismiss() {
        super.dismiss(animated: true)
    }
}
