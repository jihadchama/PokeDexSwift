import SnapKit
import UIKit

class TypeLabel: UIView {
    private lazy var typeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.sizeToFit()
        label.layer.masksToBounds = true
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    func render(_ type: Pokemon.PokemonType) {
        addSubview(typeLabel)
        
        typeLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        typeLabel.text = type.name.capitalizingFirstLetter()
        typeLabel.backgroundColor = SetupColors.setupTypeBackgroundColor(pokemonType: type)
    }
}
