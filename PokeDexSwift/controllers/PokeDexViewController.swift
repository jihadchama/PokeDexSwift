import Combine
import UIKit

class PokeDexViewController: UIViewController {
    var collectionView: UICollectionView!
    let viewModel = PokemonListViewModel()
    private var cancellables: Set<AnyCancellable> = []
    private var isPaginating: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        bindViewModel()
        viewModel.requestPokeDex()
    }
    
    private func bindViewModel() {
        viewModel.$pokemons
            .sink { [weak self] pokemons in
                self?.collectionView.reloadData()
                self?.isPaginating = false
            }.store(in: &cancellables)
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(cellType: PokemonListCollectionViewCell.self)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
}

// MARK: UICollectionView Protocols

extension PokeDexViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfItemsInSection(section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: PokemonListCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        let pokemonViewModel = viewModel.pokemonAtIndex(indexPath.item)
        cell.render(pokemon: pokemonViewModel)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        Dimensions.minimumSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        Dimensions.minimumSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        Dimensions.cardSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        Dimensions.insets
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let cellHeight = Dimensions.cardSize.height
        let contentHeight = scrollView.contentSize.height
        let screenHeight = scrollView.frame.size.height
        
        if (offset > 0 && (contentHeight - offset - screenHeight) < cellHeight && !isPaginating) {
            viewModel.requestNextPage()
            isPaginating = true
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let pokemonViewController = PokemonViewController(pokemon: viewModel.pokemonAtIndex(indexPath.row))
        present(pokemonViewController, animated: true)
    }
}
