//
//  DNAStrandApp.swift
//  DNAStrand
//
//  Created by Neil Jain on 11/5/21.
//

import SwiftUI
import DNAStrandService

@main
struct DNAStrandApp: App {
    
    var service: DNAStrandService = .init(base: "")
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.service, service)
        }
    }
    
}
