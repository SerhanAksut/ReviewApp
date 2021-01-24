
import Foundation

public struct Request<Response: Decodable> {
    let path: String
    let body: [String: Any]?
    let query: [String: String]?
    let headers: [String: String]?
    let httpMethod: HttpMethod
    let decoder: ResponseDecoder<Response>
    let decodingInfo: [CodingUserInfoKey: Any]?
    
    public init(
        path: String,
        body: [String: Any]? = nil,
        query: [String: String]? = nil,
        headers: [String: String]? = nil,
        httpMethod: HttpMethod = .get,
        decoder: @escaping ResponseDecoder<Response>,
        decodingInfo: [CodingUserInfoKey: Any]? = nil
    ) {
        self.path = path
        self.body = body
        self.query = query
        self.headers = headers
        self.httpMethod = httpMethod
        self.decoder = decoder
        self.decodingInfo = decodingInfo
    }
}
