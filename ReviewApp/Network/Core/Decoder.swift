
import Foundation

public typealias ResponseDecoder<Model: Decodable> = (Data, [CodingUserInfoKey: Any]?) throws -> Model
