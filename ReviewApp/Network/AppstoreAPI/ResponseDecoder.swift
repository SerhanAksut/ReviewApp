
import Foundation

func decode<Model>(
    data: Data,
    decodingInfo: [CodingUserInfoKey: Any]?
) throws -> Model where Model: Decodable {
    let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .useDefaultKeys
    
    do {
        #if DEBUG
            print(data.pretty)
        #endif
        let model = try decoder.decode(Model.self, from: data)
        return model
    } catch {
        throw APIError.decoding(error)
    }
}

// MARK: - Extensions
private extension Data {
    var pretty: String {
        guard let json = try? JSONSerialization.jsonObject(with: self) else { return "" }
        let options: JSONSerialization.WritingOptions
        if #available(iOS 13.0, *) {
            options = [.prettyPrinted, .withoutEscapingSlashes]
        } else {
            options = [.prettyPrinted]
        }
        let data = try! JSONSerialization.data(withJSONObject: json, options: options)
        return String(data: data, encoding: .utf8) ?? ""
    }
}
