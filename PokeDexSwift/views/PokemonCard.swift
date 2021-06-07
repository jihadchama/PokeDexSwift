import SnapKit
import UIKit

class PokemonCard: UIView {
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        return label
    }()
    
    private lazy var numberLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .heavy)
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
    
    private lazy var backgroundPokeball: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "pokeball_background")
        imageView.tintColor = .white
        imageView.alpha = 0.1
        return imageView
    }()
    
    private lazy var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    private lazy var infoContainter: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .white
        return view
    }()
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(numberLabel)
        addSubview(type1Label)
        addSubview(type2Label)
        addSubview(backgroundPokeball)
        addSubview(infoContainter)
        addSubview(pokemonImage)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(30)
        }
        
        type1Label.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel)
            make.width.greaterThanOrEqualTo(60)
            make.height.greaterThanOrEqualTo(20)
        }
        
        type2Label.snp.makeConstraints { make in
            make.top.equalTo(type1Label)
            make.leading.equalTo(type1Label.snp.trailing).offset(5)
            make.width.greaterThanOrEqualTo(60)
            make.height.greaterThanOrEqualTo(20)
        }
        
        numberLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.trailing.equalToSuperview().inset(30)
        }
        
        backgroundPokeball.snp.makeConstraints { make in
            make.size.equalTo(200)
            make.top.equalTo(pokemonImage)
            make.trailing.equalToSuperview().offset(8)
        }
        
        infoContainter.snp.makeConstraints { make in
            make.top.equalTo(pokemonImage.snp.bottom).inset(30)
            make.leading.bottom.trailing.equalToSuperview()
        }
        
        pokemonImage.snp.makeConstraints { make in
            make.top.equalTo(type1Label.snp.bottom).offset(8)
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
        }
    }
    
    func render(_ pokemon: PokemonViewModel) {
        guard let type1 = pokemon.type1 else { return }
        
        type1Label.render(type1)
        
        if let type2 = pokemon.type2 {
            type2Label.render(type2)
        }
        
        pokemonImage.load(url: URL(string: pokemon.imageURL)!)
        
        titleLabel.text = pokemon.name.capitalizingFirstLetter()
        numberLabel.text = String(pokemon.id).setupPokedexNumber()
        
        backgroundColor = SetupColors.setupBackgroundColor(pokemonType: type1)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
