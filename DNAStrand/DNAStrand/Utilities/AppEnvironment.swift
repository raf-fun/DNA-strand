//
//  AppEnvironment.swift
//  DNAStrand
//
//  Created by Neil Jain on 11/5/21.
//

import DNAStrandService
import SwiftUI

public struct Service: EnvironmentKey {
    public static let defaultValue: DNAStrandService = .init(base: "https://www.mediawiki.org/w/api.php")
}

extension EnvironmentValues {
    var service: DNAStrandService {
        get { self[Service.self] }
        set { self[Service.self] = newValue }
    }
}
