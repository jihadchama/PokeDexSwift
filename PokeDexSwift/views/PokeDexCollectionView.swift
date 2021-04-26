import Foundation
import UIKit

class PokeDexCollectionView: UICollectionView {    
    init() {
        super.init(frame: UIScreen.main.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        self.register(cellType: PokemonListCollectionViewCell.self)
        self.delegate = self
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PokeDexCollectionView: UICollectionViewDelegateFlowLayout {
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
