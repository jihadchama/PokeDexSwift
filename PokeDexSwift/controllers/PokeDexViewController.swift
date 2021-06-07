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
    
    func bindViewModel() {
        viewModel.$pokemons
            .sink { [weak self] pokemons in
                self?.collectionView.reloadData()
                self?.isPaginating = false
            }.store(in: &cancellables)
    }
    
    func setupCollectionView() {
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.register(cellType: PokemonListCollectionViewCell.self)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
    }
}

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
    
    private struct Dimensions {
        static var minimumSpacing: CGFloat = 10
        static var marginHorizontal: CGFloat = 20
        static var marginVertical: CGFloat = 10
        static var cardWidth: CGFloat = (UIScreen.main.bounds.width - (marginHorizontal * 2 + minimumSpacing)) / 2
        static var cardHeight: CGFloat = 134
        static var cardSize = CGSize(width: cardWidth, height: cardHeight)
        static var insets = UIEdgeInsets(top: marginVertical, left: marginHorizontal, bottom: marginVertical, right: marginHorizontal)
    }
}
