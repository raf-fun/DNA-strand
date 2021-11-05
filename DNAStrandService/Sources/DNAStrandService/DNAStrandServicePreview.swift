//
//  File.swift
//  
//
//  Created by Neil Jain on 11/5/21.
//

import Foundation

public class DNAStrandServicePreview: Service, DNAStrandServiceProvider {
    var errorReason: String?
    var delay: TimeInterval
    
    public init(errorReason: String? = nil, delay: TimeInterval = 5) {
        self.errorReason = errorReason
        self.delay = delay
        super.init(base: "", storage: .preview)
    }
    
    public func fetchDNAInfo(completion: @escaping (Result<Int, AppError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) { [weak self] in
            if let errorReason = self?.errorReason {
                completion(.failure(.message(errorReason)))
            } else {
                completion(.success(1))
            }
        }
    }
}

extension UserDefaults {
    static var preview: UserDefaults {
        UserDefaults(suiteName: "com.dnastrandservice.userdefault-preview")!
    }
}
