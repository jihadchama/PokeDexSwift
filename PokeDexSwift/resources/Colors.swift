import UIKit

struct Colors {
    var type: UIColor
    var background: UIColor
}

struct PokemonColors {
    static var bug = Colors(type: UIColor(red: 186/255, green: 184/255, blue: 108/255, alpha: 1),
                            background: UIColor(red: 193/255, green: 217/255, blue: 183/255, alpha: 1))
    
    static var grass = Colors(type: .systemGreen,
                              background: UIColor(red: 75/255, green: 208/255, blue: 176/255, alpha: 1))
    
    static var water = Colors(type: .systemBlue,
                              background: UIColor(red: 117/255, green: 189/255, blue: 252/255, alpha: 1))
    
    static var ice = Colors(type: UIColor(red: 137/255, green: 207/255, blue: 240/255, alpha: 1),
                            background: UIColor(red: 212/255, green: 241/255, blue: 244/255, alpha: 1))
    
    static var ground = Colors(type: UIColor(red: 210/255, green: 180/255, blue: 140/255, alpha: 1),
                               background: UIColor(red: 224/255, green: 216/255, blue: 190/255, alpha: 1))
    
    static var ghost = Colors(type: UIColor(red: 160/255, green: 32/255, blue: 240/255, alpha: 1),
                              background: UIColor(red: 130/255, green: 107/255, blue: 157/255, alpha: 1))
    
    static var fire = Colors(type: .systemRed,
                             background: UIColor(red: 248/255, green: 108/255, blue: 107/255, alpha: 1))
    
    static var electric = Colors(type: .systemYellow,
                                 background: UIColor(red: 253/255, green: 216/255, blue: 110/255, alpha: 1))
    
    static var normal = Colors(type: UIColor(red: 255/255, green: 127/255, blue: 80/255, alpha: 1),
                               background: UIColor(red: 255/255, green: 229/255, blue: 180/255, alpha: 1))
    
    static var fairy = Colors(type: UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1),
                              background: UIColor(red: 251/255, green: 141/255, blue: 160/255, alpha: 1))
    
    static var rock = Colors(type: .systemGray,
                             background: UIColor(red: 179/255, green: 169/255, blue: 169/255, alpha: 1))
    
    static var fighting = Colors(type: .systemOrange,
                                 background: UIColor(red: 253/255, green: 183/255, blue: 80/255, alpha: 1))
    
    static var dragon = Colors(type: .systemIndigo,
                               background: UIColor(red: 88/255, green: 133/255, blue: 175/255, alpha: 1))
    
    static var psychic = Colors(type: UIColor(red: 255/255, green: 105/255, blue: 180/255, alpha: 1),
                                background: UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1))
    
    static var poison = Colors(type: UIColor.systemPurple,
                               background: UIColor(red: 177/255, green: 117/255, blue: 255/255, alpha: 1))
    
    static var steel = Colors(type: UIColor.systemGray5,
                              background: .black)
}
