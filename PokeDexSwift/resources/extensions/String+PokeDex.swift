extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }

    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    func setupPokedexNumber() -> String {
        switch self.count {
        case 3:
            return "#\(self)"
        case 2:
            return "#0\(self)"
        case 1:
            return "#00\(self)"
        default:
            return "\(self)"
        }
    }
}
