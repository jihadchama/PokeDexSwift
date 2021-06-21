import UIKit
import SnapKit

protocol ViewCode: UIView {
    func addSubviews()
    func setupConstraints()
    func setupView()
}

extension ViewCode {
    func setupView() {
        addSubviews()
        setupConstraints()
    }
}
