import SnapKit
import UIKit

class PokemonInfoContainer: UIView {
    private lazy var infoContainter: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 40
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var statsContainer: PokemonStatsContainer = {
        let statsContainer = PokemonStatsContainer()
        return statsContainer
    }()
    
    private func addSubviews() {
        addSubview(infoContainter)
        infoContainter.addSubview(statsContainer)
    }
    
    private func setupConstraints() {
        infoContainter.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        statsContainer.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func render(stats: [Stats]) {
        addSubviews()
        setupConstraints()
        statsContainer.render(stats: stats)
    }
}
