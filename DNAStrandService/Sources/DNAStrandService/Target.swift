//
//  File.swift
//  
//
//  Created by Neil Jain on 11/5/21.
//

import Foundation
import Moya

public struct Target: TargetType {
    var baseURLString: String
    var endpoint: Endpoint
    public var method: Moya.Method
    public var task: Task
    public var sampleData: Data = Data()
    public var headers: [String : String]? = nil
    
    public init(base urlString: String, endpoint: Endpoint, method: Moya.Method, task: Task, headers: [String: String]? = nil) {
        self.baseURLString = urlString
        self.endpoint = endpoint
        self.method = method
        self.task = task
        self.headers = headers
    }
    
    public var baseURL: URL {
        let components = URLComponents(string: baseURLString)
        guard let url = components?.url else {
            fatalError("Please check baseURLString")
        }
        return url
    }
    
    public var path: String {
        self.endpoint.path
    }
}
