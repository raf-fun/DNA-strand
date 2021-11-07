//
//  AppView.swift
//  DNAStrand
//
//  Created by Neil Jain on 11/7/21.
//

import SwiftUI

struct AppView: View {
    @StateObject var store: GeneViewModel = .init()
    
    var body: some View {
        HomeView(geneStore: store)
            .task {
                await store.getGene()
            }
    }
}
