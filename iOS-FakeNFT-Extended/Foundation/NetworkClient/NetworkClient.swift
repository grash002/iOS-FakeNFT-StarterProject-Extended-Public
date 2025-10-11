import Foundation

enum NetworkClientError: Error {
    case httpStatusCode(Int)
    case urlRequestError(Error)
    case urlSessionError
    case parsingError
    case incorrectRequest(String)
}

protocol NetworkClient {
    func send(request: NetworkRequest) async throws -> Data
    func send<T: Decodable>(request: NetworkRequest) async throws -> T
}

actor DefaultNetworkClient: NetworkClient {
    private let session: URLSession
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder

    init(
        session: URLSession = URLSession.shared,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder()
    ) {
        self.session = session
        self.decoder = decoder
        self.encoder = encoder
    }

    func send(request: NetworkRequest) async throws -> Data {
        let urlRequest = try create(request: request)
        let (data, response) = try await session.data(for: urlRequest)
        guard let response = response as? HTTPURLResponse else {
            throw NetworkClientError.urlSessionError
        }
        guard 200 ..< 300 ~= response.statusCode else {
            throw NetworkClientError.httpStatusCode(response.statusCode)
        }
        return data
    }

    func send<T: Decodable>(request: NetworkRequest) async throws -> T {
        let data = try await send(request: request)
        return try await parse(data: data)
    }

    // MARK: - Private

    private func create(request: NetworkRequest) throws -> URLRequest {
        guard let endpoint = request.endpoint else {
            throw NetworkClientError.incorrectRequest("Empty endpoint")
        }

        var urlRequest = URLRequest(url: endpoint)
        urlRequest.httpMethod = request.httpMethod.rawValue

        if let dto = request.dto {
            urlRequest.setValue(request.contentType.rawValue, forHTTPHeaderField: "Content-Type")
            
            switch request.contentType {
            case .json:
                urlRequest.httpBody = try? JSONEncoder().encode(dto)
            case .urlEncoded:
                urlRequest.httpBody = asURLEncodedData(dto)
            }
        }
        
        urlRequest.addValue(RequestConstants.token, forHTTPHeaderField: "X-Practicum-Mobile-Token")

        return urlRequest
    }

    func asURLEncodedData(_ dto: Encodable) -> Data? {
        guard let data = try? JSONEncoder().encode(dto),
              let parameters = try? JSONSerialization.jsonObject(with: data) as? [String: Any]
        else { return nil }
        
        var components: [String] = []
        
        for (key, value) in parameters {
            switch value {
            case let array as [Any]:
                for item in array {
                    let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? key
                    let encodedValue = "\(item)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                    components.append("\(encodedKey)=\(encodedValue)")
                }
            default:
                let encodedKey = key.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? key
                let encodedValue = "\(value)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
                components.append("\(encodedKey)=\(encodedValue)")
            }
        }
        
        let bodyString = components.joined(separator: "&")
        return bodyString.data(using: .utf8)
    }
    
    private func parse<T: Decodable>(data: Data) async throws -> T {
        do {
            return try decoder.decode(T.self, from: data)
        } catch {
            throw NetworkClientError.parsingError
        }
    }
}
