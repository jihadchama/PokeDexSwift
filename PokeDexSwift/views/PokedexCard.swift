import SnapKit
import UIKit

class PokedexCard: UIView {
    private lazy var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.2)
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    private lazy var type1Label: TypeLabel = {
        let typeLabel = TypeLabel()
        return typeLabel
    }()
    
    private lazy var type2Label: TypeLabel = {
        let typeLabel = TypeLabel()
        return typeLabel
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var backgroundPokeball: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "pokeball_background")
        imageView.tintColor = .white
        imageView.alpha = 0.1
        return imageView
    }()
    
    private func setupConstraints() {
        container.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(8)
            make.trailing.equalToSuperview().inset(8)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.left.equalToSuperview().offset(16)
        }
        
        type1Label.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.left.equalTo(nameLabel)
            make.width.greaterThanOrEqualTo(60)
            make.height.greaterThanOrEqualTo(20)
        }
        
        type2Label.snp.makeConstraints { make in
            make.top.equalTo(type1Label.snp.bottom).offset(8)
            make.left.equalTo(type1Label)
            make.width.greaterThanOrEqualTo(60)
            make.height.greaterThanOrEqualTo(20)
        }
        
        pokemonImage.snp.makeConstraints { make in
            make.width.height.equalTo(80)
            make.bottom.right.equalToSuperview().inset(8)
        }
        
        backgroundPokeball.snp.makeConstraints { make in
            make.size.equalTo(130)
            make.bottom.right.equalToSuperview().offset(24)
        }
    }
    
    private func addSubviews() {
        addSubview(container)
        container.addSubview(numberLabel)
        container.addSubview(nameLabel)
        container.addSubview(type1Label)
        container.addSubview(type2Label)
        container.addSubview(backgroundPokeball)
        container.addSubview(pokemonImage)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func render(_ pokemon: PokemonViewModel) {
        guard let type1 = pokemon.type1 else {
            fatalError("Pokemon must have at least one type.")
        }
        
        pokemonImage.load(url: URL(string: pokemon.imageURL)!)

        container.backgroundColor = SetupColors.setupBackgroundColor(pokemonType: type1)
        type1Label.render(type1)
        
        if let type2 = pokemon.type2 {
            type2Label.render(type2)
        }
        
        nameLabel.text = pokemon.name.capitalizingFirstLetter()
        numberLabel.text = String(pokemon.id).setupPokedexNumber()
    }
}
