import UIKit

struct Colors {
    var type: UIColor
    var background: UIColor
}

struct PokemonColors {
    static var bug = Colors(type: UIColor(red: 153, green: 177, blue: 143),
                            background: UIColor(red: 193, green: 217, blue: 183))

    static var grass = Colors(type: .systemGreen,
                              background: UIColor(red: 75, green: 208, blue: 176))
    
    static var water = Colors(type: .systemBlue,
                              background: UIColor(red: 117, green: 189, blue: 252))
    
    static var ice = Colors(type: UIColor(red: 137, green: 207, blue: 240),
                            background: UIColor(red: 212, green: 241, blue: 244))
    
    static var ground = Colors(type: UIColor(red: 210, green: 180, blue: 140),
                               background: UIColor(red: 224, green: 216, blue: 190))
    
    static var ghost = Colors(type: UIColor(red: 160, green: 32, blue: 240),
                              background: UIColor(red: 130, green: 107, blue: 157))
    
    static var fire = Colors(type: .systemRed,
                             background: UIColor(red: 248, green: 108, blue: 107))
    
    static var electric = Colors(type: .systemYellow,
                                 background: UIColor(red: 253, green: 216, blue: 110))
    
    static var normal = Colors(type: UIColor(red: 230, green: 200, blue: 140),
                               background: UIColor(red: 255, green: 229, blue: 180))
    
    static var fairy = Colors(type: UIColor(red: 255, green: 192, blue: 203),
                              background: UIColor(red: 251, green: 141, blue: 160))
    
    static var rock = Colors(type: .systemGray,
                             background: UIColor(red: 179, green: 169, blue: 169))
    
    static var fighting = Colors(type: .systemOrange,
                                 background: UIColor(red: 253, green: 183, blue: 80))
    
    static var dragon = Colors(type: .systemIndigo,
                               background: UIColor(red: 88, green: 133, blue: 175))
    
    static var psychic = Colors(type: UIColor(red: 255, green: 105, blue: 180),
                                background: UIColor(red: 255, green: 192, blue: 203))
    
    static var poison = Colors(type: UIColor.systemPurple,
                               background: UIColor(red: 177, green: 117, blue: 255))
    
    static var steel = Colors(type: UIColor(red: 159, green: 163, blue: 172),
                              background: UIColor(red: 233, green: 234, blue: 236))
    
    static var dark = Colors(type: UIColor(red: 80, green: 80, blue: 80),
                             background: UIColor(red: 120, green: 120,blue: 120))
    
    static var flying = Colors(type: UIColor(red: 154, green: 206, blue: 235),
                               background: UIColor(red: 102, green: 153, blue: 204))
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
}
