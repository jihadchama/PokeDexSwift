import UIKit

struct Dimensions {
    static var minimumSpacing: CGFloat = 10
    static var marginHorizontal: CGFloat = 20
    static var marginVertical: CGFloat = 10
    static var cardWidth: CGFloat = (UIScreen.main.bounds.width - (marginHorizontal * 2 + minimumSpacing)) / 2
    static var cardHeight: CGFloat = 134
    static var cardSize = CGSize(width: cardWidth, height: cardHeight)
    static var insets = UIEdgeInsets(top: marginVertical, left: marginHorizontal, bottom: marginVertical, right: marginHorizontal)
}
