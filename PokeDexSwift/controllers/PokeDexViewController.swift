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
        viewModel.fetchSortedData()
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
        viewModel.pokemons.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PokemonListCollectionViewCell.identifier, for: indexPath) as! PokemonListCollectionViewCell
        cell.render(pokemon: viewModel.pokemons[indexPath.item])
        return cell
    }
}
