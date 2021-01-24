
struct Feed: Decodable {
    let reviews: [Review]
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let feedContainer = try container.nestedContainer(
            keyedBy: CodingKeys.self,
            forKey: .feed
        )
        reviews = try feedContainer.decode([Review].self, forKey: .reviews)
    }
    
    private enum CodingKeys: String, CodingKey {
        case feed
        case reviews = "entry"
    }
}
