//
//  File.swift
//  
//
//  Created by Neil Jain on 11/5/21.
//

import Foundation
import Moya
import Alamofire

public class Service {
    var baseURLString: String
    var storage: UserDefaults
    
    var defaultNoInternetMessage: String = "Internet connection is not available. Please check and try again."
    
    private lazy var loggerPlugin: NetworkLoggerPlugin = {
        NetworkLoggerPlugin(configuration: .init(logOptions: .verbose))
    }()
    
    private lazy var provider: MoyaProvider<Target> = {
        MoyaProvider(
            plugins: [
                loggerPlugin
            ]
        )
    }()
    
    public init(base urlString: String, storage: UserDefaults = .standard, defaultMessage: String = "Internet connection is not available. Please check and try again.") {
        self.baseURLString = urlString
        self.storage = storage
    }
}

public extension Service {
    func decodeResponse<T: Decodable>(target: Target, completion: @escaping (Result<T, AppError>)->Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let dataResponse = try response.map(T.self)
                    completion(.success(dataResponse))
                } catch {
                    print(error)
                    completion(.failure(.message(error.localizedDescription)))
                }
            case .failure(let error):
                switch error {
                case .underlying(let underlyingError, _):
                    if let code = ((underlyingError as? Alamofire.AFError)?.underlyingError as? URLError)?.code, code == URLError.Code.dataNotAllowed || code == URLError.Code.notConnectedToInternet {
                        completion(.failure(.message(self.defaultNoInternetMessage)))
                    } else {
                        completion(.failure(.message(underlyingError.localizedDescription)))
                    }
                default:
                    completion(.failure(.message(error.localizedDescription)))
                }
            }
        }
    }
}

// MARK: - Target points
public extension Service {
    func getTarget(_ endpoint: Endpoint, request: Encodable? = nil) -> Target {
        Target(
            base: baseURLString,
            endpoint: endpoint,
            method: .get,
            task: request == nil ? .requestPlain : .requestParameters(parameters: request?.dictionary ?? [:], encoding: URLEncoding.default),
            headers: nil
        )
    }
    
    func postTarget(_ endpoint: Endpoint, request: Encodable? = nil) -> Target {
        Target(
            base: baseURLString,
            endpoint: endpoint,
            method: .post,
            task: request == nil ? .requestPlain : .requestJSONEncodable(request!),
            headers: nil
        )
    }
    
    func patchTarget(_ endpoint: Endpoint, request: Encodable? = nil) -> Target {
        Target(
            base: baseURLString,
            endpoint: endpoint,
            method: .patch,
            task: request == nil ? .requestPlain : .requestJSONEncodable(request!),
            headers: nil
        )
    }
    
    func putTarget(_ endpoint: Endpoint, request: Encodable? = nil) -> Target {
        Target(
            base: baseURLString,
            endpoint: endpoint,
            method: .put,
            task: request == nil ? .requestPlain : .requestJSONEncodable(request!),
            headers: nil
        )
    }
    
    func deleteTarget(_ endpoint: Endpoint, request: Encodable? = nil) -> Target {
        Target(
            base: baseURLString,
            endpoint: endpoint,
            method: .delete,
            task: request == nil ? .requestPlain : .requestJSONEncodable(request!),
            headers: nil
        )
    }
    
}

public extension Encodable {
    var dictionary: [String: Any]? {
        do {
            let encoded = try JSONEncoder().encode(self)
            return try JSONSerialization.jsonObject(with: encoded, options: .mutableContainers) as? [String: Any]
        } catch {
            print(error)
            return nil
        }
    }
}
