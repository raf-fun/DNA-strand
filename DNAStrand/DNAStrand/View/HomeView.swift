//
//  DNAStrandHomeView.swift
//  DNAStrand
//
//  Created by Cesar Palma on 2021-11-06.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    @ObservedObject var geneStore: GeneViewModel
    
    @State private var showDetails = false
    @State private var showCredits = false
    @State private var selectedGeneCard: WikiData?
    
    var allGenes: [WikiData] = []
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground).ignoresSafeArea()
            
            if showDetails, let selectedGeneCard = selectedGeneCard {
                CardFullView(
                    gene: selectedGeneCard,
                    namespace: namespace,
                    showDetails: $showDetails
                )
            }
            else {
                ScrollView {
                    HStack {
                        Text("DNAStrand")
                            .bold()
                            .font(.largeTitle)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        Spacer()
                        
                        Button {
                            showCredits = true
                        } label: {
                            Image(systemName: "info.circle")
                                .padding(.horizontal)
                        }
                    }
                    .zIndex(1)
                    
                    cards
                }
            }
        }
        .statusBar(hidden: showDetails)
        .sheet(isPresented: $showCredits) {
            CreditsView()
        }

    }
    
    @ViewBuilder
    var cards: some View {
        switch geneStore.dataPhase {
        case .empty:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        case .success(let genes):
            ForEach(genes, id: \.wikidata.title) { gene in
                CardView(gene: gene.wikidata, namespace: namespace)
                    .padding()
                    .onTapGesture {
                        withAnimation(.openCard) {
                            selectedGeneCard = gene.query.pages.resultData
                            showDetails =  true
                        }
                    }
            }
        case .failure(let error):
            Text(error.localizedDescription)
        }
        
    }
    
}

#if DEBUG
struct DNAStrandHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(geneStore: GeneViewModel.init())
    }
}
#endif
