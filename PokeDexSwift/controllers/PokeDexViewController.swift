import Combine
import UIKit

class PokeDexViewController: UIViewController, UICollectionViewDataSource {
    var collectionView: PokeDexCollectionView!
    let viewModel = PokemonListViewModel()
    private var cancellables: Set<AnyCancellable> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        collectionView.dataSource = self
        bindViewModel()
        viewModel.fetchAndSortPokemons()
    }
    
    func bindViewModel() {
        viewModel.$pokemons
            .sink { [weak self] pokemons in
                self?.collectionView.reloadData()
            }.store(in: &cancellables)
    }
    
    func setupCollectionView() {
        collectionView = PokeDexCollectionView()
        view.addSubview(collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokemonListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath) 
        let pokemonViewModel = viewModel.pokemonAtIndex(indexPath.item)
        cell.render(pokemon: pokemonViewModel)
        return cell
    }
}
