//
//  MainView.swift
//  DNAStrandAPP
//
//  Created by Djallil Elkebir on 2021-11-05.
//

import SwiftUI

struct MainView: View {
    @StateObject var geneStore = GeneViewModel()
    @State private var showCredits = false
    
    var body: some View {
        NavigationView {
            GeneViewLoader(geneVM: geneStore, showGene: .Insulin)
                .navigationTitle("Most Popular Genes")
                .navigationBarItems(trailing: creditItem)
        }
        .sheet(isPresented: $showCredits) {
            CreditsView()
        }
        .task {
            await geneStore.getGene()
        }
    }
    
    var creditItem: some View {
        Button {
            showCredits = true
        } label: {
            Image(systemName: "info.circle")
                .padding(.horizontal)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
