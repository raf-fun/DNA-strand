//
//  File.swift
//  
//
//  Created by Neil Jain on 11/5/21.
//

import Foundation
import Moya

public enum Endpoint {
    case dnaWiki
}

extension Endpoint {
    var path: String {
        switch self {
        case .dnaWiki:
            return ""
        }
    }
}
