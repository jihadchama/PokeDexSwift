import SnapKit
import UIKit

class PokemonStatsContainer: UIView {
    private lazy var baseStatsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.text = "Base Stats"
        return label
    }()
    
    private lazy var lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray5
        view.layer.cornerRadius = 1.5
        return view
    }()
    
    private lazy var hpContainer: StatsContainer = {
        let container = StatsContainer()
        return container
    }()
    
    private lazy var attackContainer: StatsContainer = {
        let container = StatsContainer()
        return container
    }()
    
    private lazy var defenseContainer: StatsContainer = {
        let container = StatsContainer()
        return container
    }()
    
    private lazy var spAttackContainer: StatsContainer = {
        let container = StatsContainer()
        return container
    }()
    
    private lazy var spDefenseContainer: StatsContainer = {
        let container = StatsContainer()
        return container
    }()
    
    private lazy var speedContainer: StatsContainer = {
        let container = StatsContainer()
        return container
    }()
    
    private func addSubviews() {
        addSubview(baseStatsLabel)
        addSubview(hpContainer)
        addSubview(attackContainer)
        addSubview(defenseContainer)
        addSubview(spAttackContainer)
        addSubview(spDefenseContainer)
        addSubview(speedContainer)
        addSubview(lineView)
    }
    
    private func setupConstraints() {
        baseStatsLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.centerX.equalToSuperview()
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.top.equalTo(baseStatsLabel.snp.bottom).offset(20)
            make.height.equalTo(3)
        }
        
        hpContainer.snp.makeConstraints { make in
            make.top.equalTo(baseStatsLabel.snp.bottom)
            make.width.equalToSuperview()
        }
        
        attackContainer.snp.makeConstraints { make in
            make.top.equalTo(hpContainer.snp.bottom).offset(30)
            make.width.equalToSuperview()
        }
        
        defenseContainer.snp.makeConstraints { make in
            make.top.equalTo(attackContainer.snp.bottom).offset(30)
            make.width.equalToSuperview()
        }
        
        spAttackContainer.snp.makeConstraints { make in
            make.top.equalTo(defenseContainer.snp.bottom).offset(30)
            make.width.equalToSuperview()
        }
        
        spDefenseContainer.snp.makeConstraints { make in
            make.top.equalTo(spAttackContainer.snp.bottom).offset(30)
            make.width.equalToSuperview()
        }
        
        speedContainer.snp.makeConstraints { make in
            make.top.equalTo(spDefenseContainer.snp.bottom).offset(30)
            make.width.equalToSuperview()
        }
    }
    
    private func setupStatsContainers(_ stats: [Stats]) {
        hpContainer.render(title: "HP", value: stats[0].baseStats)
        attackContainer.render(title: "Attack", value: stats[1].baseStats)
        defenseContainer.render(title: "Defense", value: stats[2].baseStats)
        spAttackContainer.render(title: "Sp. Atk", value: stats[3].baseStats)
        spDefenseContainer.render(title: "Sp. Def", value: stats[4].baseStats)
        speedContainer.render(title: "Speed", value: stats[5].baseStats)
    }
    
    func render(stats: [Stats]) {
        addSubviews()
        setupConstraints()
        setupStatsContainers(stats)
    }
}
