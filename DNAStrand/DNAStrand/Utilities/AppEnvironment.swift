//
//  AppEnvironment.swift
//  DNAStrand
//
//  Created by Neil Jain on 11/5/21.
//

import DNAStrandService
import SwiftUI

public struct Service: EnvironmentKey {
    public static let defaultValue: DNAStrandServiceProvider = DNAStrandService(base: "https://www.mediawiki.org/w/api.php")
    
    public static let defaultValuePreview: DNAStrandServiceProvider = DNAStrandServicePreview(errorReason: "Could not get DNA Data")
}

extension EnvironmentValues {
    var service: DNAStrandServiceProvider {
        get { self[Service.self] }
        set { self[Service.self] = newValue }
    }
}
