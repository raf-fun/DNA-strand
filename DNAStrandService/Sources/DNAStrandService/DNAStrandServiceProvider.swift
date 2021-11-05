//
//  File.swift
//  
//
//  Created by Neil Jain on 11/5/21.
//

import Foundation

public protocol DNAStrandServiceProvider: Service {
    func fetchDNAInfo(completion: @escaping (Result<Int, AppError>)->Void)
}
