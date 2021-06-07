import SnapKit
import UIKit

class StatsContainer: UIView {
    private lazy var statsTitle: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var statsValue: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private lazy var statsBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var statsForeground: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        view.layer.cornerRadius = 3
        return view
    }()
    
    private func addSubviews() {
        addSubview(statsTitle)
        addSubview(statsValue)
        addSubview(statsBackground)
        addSubview(statsForeground)
    }
    
    private func setupConstraints() {
        statsTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(60)
            make.leading.equalToSuperview().offset(30)
            make.width.greaterThanOrEqualTo(70)
        }
        
        statsValue.snp.makeConstraints { make in
            make.leading.equalTo(statsTitle.snp.trailing).offset(10)
            make.width.greaterThanOrEqualTo(30)
            make.top.equalTo(statsTitle)
        }
        
        statsBackground.snp.makeConstraints { make in
            make.centerY.equalTo(statsTitle)
            make.leading.equalTo(statsValue.snp.trailing).offset(20)
            make.trailing.equalToSuperview().inset(30)
            make.height.equalTo(5)
        }
    }
    
    func renderStatusGraph(value: Double) {
        statsForeground.snp.makeConstraints { make in
            make.top.height.leading.equalTo(statsBackground)
            make.width.equalTo(statsBackground.snp.width).multipliedBy(value/255)
        }
    }
    
    func render(title: String, value: Int) {
        addSubviews()
        setupConstraints()
        
        statsTitle.text = title
        statsValue.text = String(value)
        
        renderStatusGraph(value: Double(value))
        
        switch value {
        case 0..<80:
            statsForeground.backgroundColor = .systemRed
        case 80..<120:
            statsForeground.backgroundColor = .systemGreen
        case 120...:
            statsForeground.backgroundColor = .systemBlue
        default:
            break
        }
    }
}
