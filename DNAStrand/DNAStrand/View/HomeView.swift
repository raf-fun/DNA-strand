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
            DigitalRain()
            
            ScrollView {
                HStack {
                    Text("inGENEious")
                        .bold()
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                        .foregroundStyle(LinearGradient(colors: [Color(.darkGreen), Color.accentColor], startPoint: .leading, endPoint: .trailing))
                    
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
            }.overlay(
                overlayView
            )
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
            VStack{
                Spacer(minLength: 250)
                DNAShapeRetryLoaderView()
                Spacer()
            }
        case .success(let genes):
            ForEach(genes, id: \.wikidata.title) { gene in
                CardView(gene: gene.wikidata, namespace: namespace)
                    .matchedGeometryEffect(id: "card\(gene.wikidata.id)", in: namespace)
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
    
    @ViewBuilder
    var overlayView: some View {
        if showDetails, let selectedGeneCard = selectedGeneCard {
            CardFullView(
                gene: selectedGeneCard,
                namespace: namespace,
                showDetails: $showDetails
            )
            .ignoresSafeArea(.all, edges: .all)
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
