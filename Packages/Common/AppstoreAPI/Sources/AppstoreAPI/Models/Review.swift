
import Foundation

public struct Review: Equatable {
    public let id: String
    public let author: String
    public let rating: UInt
    public let title: String
    public let content: String
    public let version: String
    
    public init(
        id: String,
        author: String,
        rating: UInt,
        title: String,
        content: String,
        version: String
    ) {
        self.id = id
        self.author = author
        self.rating = rating
        self.title = title
        self.content = content
        self.version = version
    }
}

// MARK: - Decodable
extension Review: Decodable {
    public init(from decoder: Decoder) throws {
        let idContainer = try decoder.container(keyedBy: CodingKeys.IDContainer.self)
        let idValueContainer = try idContainer.nestedContainer(
            keyedBy: CodingKeys.IDContainer.IDValueContainer.self,
            forKey: .idContainer
        )
        id = try idValueContainer.decode(String.self, forKey: .id)
        
        let authorContainer = try decoder.container(keyedBy: CodingKeys.AuthorContainer.self)
        let authorNameContainer = try authorContainer.nestedContainer(
            keyedBy: CodingKeys.AuthorContainer.AuthorNameContainer.self,
            forKey: .authorContainer
        )
        let authorNameValueContainer = try authorNameContainer.nestedContainer(
            keyedBy: CodingKeys.AuthorContainer.AuthorNameContainer.AuthorNameValueContainer.self,
            forKey: .nameContainer
        )
        author = try authorNameValueContainer.decode(String.self, forKey: .name)
        
        let ratingContainer = try decoder.container(keyedBy: CodingKeys.RatingContainer.self)
        let ratingValueContainer = try ratingContainer.nestedContainer(
            keyedBy: CodingKeys.RatingContainer.RatingValueContainer.self,
            forKey: .ratingContainer
        )
        let ratingText: String = try ratingValueContainer.decode(String.self, forKey: .rating)
        rating = UInt(ratingText) ?? 0
        
        let titleContainer = try decoder.container(keyedBy: CodingKeys.TitleContainer.self)
        let titleValueContainer = try titleContainer.nestedContainer(
            keyedBy: CodingKeys.TitleContainer.TitleValueContainer.self,
            forKey: .titleContainer
        )
        title = try titleValueContainer.decode(String.self, forKey: .title)
        
        let contentContainer = try decoder.container(keyedBy: CodingKeys.ContentContainer.self)
        let contentValueContainer = try contentContainer.nestedContainer(
            keyedBy: CodingKeys.ContentContainer.ContentValueContainer.self,
            forKey: .contentContainer
        )
        content = try contentValueContainer.decode(String.self, forKey: .content)
        
        let versionContainer = try decoder.container(keyedBy: CodingKeys.VersionContainer.self)
        let versionValueContainer = try versionContainer.nestedContainer(
            keyedBy: CodingKeys.VersionContainer.VersionValueContainer.self,
            forKey: .versionContainer
        )
        version = try versionValueContainer.decode(String.self, forKey: .version)
    }
    
    private enum CodingKeys: CodingKey {
        enum AuthorContainer: String, CodingKey {
            case authorContainer = "author"
            
            enum AuthorNameContainer: String, CodingKey {
                case nameContainer = "name"
                
                enum AuthorNameValueContainer: String, CodingKey {
                    case name = "label"
                }
            }
        }
        
        enum VersionContainer: String, CodingKey {
            case versionContainer = "im:version"
            
            enum VersionValueContainer: String, CodingKey {
                case version = "label"
            }
        }
        
        enum RatingContainer: String, CodingKey {
            case ratingContainer = "im:rating"
            
            enum RatingValueContainer: String, CodingKey {
                case rating = "label"
            }
        }
        
        enum IDContainer: String, CodingKey {
            case idContainer = "id"
            
            enum IDValueContainer: String, CodingKey {
                case id = "label"
            }
        }
        
        enum TitleContainer: String, CodingKey {
            case titleContainer = "title"
            
            enum TitleValueContainer: String, CodingKey {
                case title = "label"
            }
        }
        
        enum ContentContainer: String, CodingKey {
            case contentContainer = "content"
            
            enum ContentValueContainer: String, CodingKey {
                case content = "label"
            }
        }
    }
}

// MARK: - External Helpers
public extension Review {
    var ratingVersionText: String {
        if rating > 0 {
            var result = ""
            for _ in 0..<rating {
                result += "⭐️"
            }
            return "\(result) (ver: \(version))"
        } else {
            return "(ver:\(version))"
        }
    }
    
    var authorText: String {
        "from: \(author)"
    }
}
