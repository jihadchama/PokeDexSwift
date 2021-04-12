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
        label.backgroundColor = .systemTeal
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
        label.backgroundColor = .systemPurple
        label.layer.cornerRadius = 10
        label.sizeToFit()
        label.layer.masksToBounds = true
        label.font = .boldSystemFont(ofSize: 12)
        return label
    }()
    
    lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
//        imageView.image = UIImage(named: "bulbasaur")
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
            make.bottom.equalToSuperview().inset(8)
            make.right.equalToSuperview().inset(8)
        }
        
        backgroundPokeball.snp.makeConstraints { make in
            make.size.equalTo(130)
            make.bottom.equalToSuperview().offset(24)
            make.right.equalToSuperview().offset(24)
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
    
    func render(_ pokemon: Pokemon) {
        container.backgroundColor = setupBackgroundColor(pokemonType: pokemon.types[0].type)
        
        nameLabel.text = pokemon.name.capitalizingFirstLetter()
        numberLabel.text = String(pokemon.id).setupPokedexNumber()
        type1Label.text = pokemon.types[0].type.name.capitalizingFirstLetter()
        type1Label.backgroundColor = setupTypeBackgroundColor(pokemonType: pokemon.types[0].type)
        
        if pokemon.types.count > 1 {
            type2Label.text = pokemon.types[1].type.name.capitalizingFirstLetter()
            type2Label.backgroundColor = setupTypeBackgroundColor(pokemonType: pokemon.types[1].type)
        } else {
            type2Label.isHidden = true
        }
        
        pokemonImage.load(url: URL(string: "https://pokeres.bastionbot.org/images/pokemon/\(pokemon.id).png")!)
    }
    
    fileprivate func setupBackgroundColor(pokemonType: Pokemon.PokemonType) -> UIColor {
        switch pokemonType.name {
        case "bug":
            return UIColor(red: 193/255, green: 217/255, blue: 183/255, alpha: 1)
        case "grass":
            return UIColor(red: 75/255, green: 208/255, blue: 176/255, alpha: 1)
        case "water":
            return UIColor(red: 117/255, green: 189/255, blue: 252/255, alpha: 1)
        case "ice":
            return UIColor(red: 212/255, green: 241/255, blue: 244/255, alpha: 1)
        case "ground":
            return UIColor(red: 224/255, green: 216/255, blue: 190/255, alpha: 1)
        case "ghost":
            return UIColor(red: 130/255, green: 107/255, blue: 157/255, alpha: 1)
        case "fire":
            return UIColor(red: 248/255, green: 108/255, blue: 107/255, alpha: 1)
        case "electric":
            return UIColor(red: 253/255, green: 216/255, blue: 110/255, alpha: 1)
        case "normal":
            return UIColor(red: 255/255, green: 229/255, blue: 180/255, alpha: 1)
        case "fairy":
            return UIColor(red: 251/255, green: 141/255, blue: 160/255, alpha: 1)
        case "rock":
            return UIColor(red: 179/255, green: 169/255, blue: 169/255, alpha: 1)
        case "fighting":
            return UIColor(red: 253/255, green: 183/255, blue: 80/255, alpha: 1)
        case "dragon":
            return UIColor(red: 88/255, green: 133/255, blue: 175/255, alpha: 1)
        case "psychic":
            return UIColor(red: 249/255, green: 88/255, blue: 135/255, alpha: 1)
        case "poison":
            return UIColor(red: 177/255, green: 117/255, blue: 255/255, alpha: 1)
        default:
            return .black
        }
    }
    
    fileprivate func setupTypeBackgroundColor(pokemonType: Pokemon.PokemonType) -> UIColor {
        switch pokemonType.name {
        case "bug":
            return UIColor(red: 186/255, green: 184/255, blue: 108/255, alpha: 1)
        case "grass":
            return .systemGreen
        case "water":
            return .systemBlue
        case "ice", "flying":
            return UIColor(red: 137/255, green: 207/255, blue: 240/255, alpha: 1)
        case "ground":
            return UIColor(red: 210/255, green: 180/255, blue: 140/255, alpha: 1)
        case "ghost":
            return UIColor(red: 160/255, green: 32/255, blue: 240/255, alpha: 1)
        case "fire":
            return .systemRed
        case "electric":
            return .systemYellow
        case "normal":
            return UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1)
        case "fairy":
            return UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1)
        case "rock":
            return .systemGray
        case "fighting":
            return .systemOrange
        case "dragon":
            return .systemIndigo
        case "psychic":
            return UIColor(red: 255/255, green: 105/255, blue: 180/255, alpha: 1)
        case "poison":
            return .systemPurple
        case "steel":
            return .systemGray5
        default:
            return .black
        }
    }
}
