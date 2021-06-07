import SnapKit
import UIKit

class PokemonCard: UIView {
    lazy var container: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 12
        view.clipsToBounds = true
        return view
    }()
    
    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .heavy)
        return label
    }()
    
    lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black.withAlphaComponent(0.2)
        label.font = .systemFont(ofSize: 16, weight: .heavy)
        return label
    }()
    
    lazy var type1Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.sizeToFit()
        label.layer.masksToBounds = true
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var type2Label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .center
        label.layer.cornerRadius = 10
        label.sizeToFit()
        label.layer.masksToBounds = true
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    lazy var backgroundPokeball: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "pokeball_background")
        imageView.tintColor = .white
        imageView.alpha = 0.1
        return imageView
    }()
 
    fileprivate func setupConstraints() {
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
    
    fileprivate func addSubviews() {
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
        
        pokemonImage.load(url: URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(pokemon.id).png")!)

        container.backgroundColor = setupBackgroundColor(pokemonType: type1)
        type1Label.text = type1.name.capitalizingFirstLetter()
        type1Label.backgroundColor = setupTypeBackgroundColor(pokemonType: type1)
        
        if let type2 = pokemon.type2 {
            type2Label.text = type2.name.capitalizingFirstLetter()
            type2Label.backgroundColor = setupTypeBackgroundColor(pokemonType: type2)
        }
        
        nameLabel.text = pokemon.name.capitalizingFirstLetter()
        numberLabel.text = String(pokemon.id).setupPokedexNumber()
    }
    
    fileprivate func setupBackgroundColor(pokemonType: Pokemon.PokemonType) -> UIColor {
        switch pokemonType.name {
        case "bug":
            return PokemonColors.bug.background
        case "grass":
            return PokemonColors.grass.background
        case "water":
            return PokemonColors.water.background
        case "ice":
            return PokemonColors.ice.background
        case "ground":
            return PokemonColors.ground.background
        case "ghost":
            return PokemonColors.ghost.background
        case "fire":
            return PokemonColors.fire.background
        case "electric":
            return PokemonColors.electric.background
        case "normal":
            return PokemonColors.normal.background
        case "fairy":
            return PokemonColors.fairy.background
        case "rock":
            return PokemonColors.rock.background
        case "fighting":
            return PokemonColors.fighting.background
        case "dragon":
            return PokemonColors.dragon.background
        case "psychic":
            return PokemonColors.psychic.background
        case "poison":
            return PokemonColors.poison.background
        case "dark":
            return PokemonColors.dark.background
        case "steel":
            return PokemonColors.steel.background
        case "flying":
            return PokemonColors.flying.background
        default:
            return .black
        }
    }
    
    fileprivate func setupTypeBackgroundColor(pokemonType: Pokemon.PokemonType) -> UIColor {
        switch pokemonType.name {
        case "bug":
            return PokemonColors.bug.type
        case "grass":
            return PokemonColors.grass.type
        case "water":
            return PokemonColors.water.type
        case "ice":
            return PokemonColors.ice.type
        case "ground":
            return PokemonColors.ground.type
        case "ghost":
            return PokemonColors.ghost.type
        case "fire":
            return PokemonColors.fire.type
        case "electric":
            return PokemonColors.electric.type
        case "normal":
            return PokemonColors.normal.type
        case "fairy":
            return PokemonColors.fairy.type
        case "rock":
            return PokemonColors.rock.type
        case "fighting":
            return PokemonColors.fighting.type
        case "dragon":
            return PokemonColors.dragon.type
        case "psychic":
            return PokemonColors.psychic.type
        case "poison":
            return PokemonColors.poison.type
        case "steel":
            return PokemonColors.steel.type
        case "dark":
            return PokemonColors.dark.type
        case "flying":
            return PokemonColors.flying.type
        default:
            return .black
        }
    }
}
