struct Stats: Codable {
    var baseStats: Int
    var stat: Stat
    
    enum CodingKeys: String, CodingKey {
        case baseStats = "base_stat"
        case stat
    }
}

struct Stat: Codable {
    var name: String
    
    enum CodingKeys: String, CodingKey {
        case name
    }
}
