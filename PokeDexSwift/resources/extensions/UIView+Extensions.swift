import UIKit

extension UIView {
    func removeAllSubViews() {
        for view in self.subviews {
            view.removeFromSuperview()
        }
    }
}
