//
//  DNAStrandHomeView.swift
//  DNAStrand
//
//  Created by Cesar Palma on 2021-11-06.
//

import SwiftUI

struct HomeView: View {
    @Namespace var namespace
    
    @State private var showDetails = false
    @State private var showCredits = false
    @State private var selectedGeneCard: WikiDataPreview?
    
    var allGenes: [WikiDataPreview] = WikiDataPreview.geneDataExample
    
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground).ignoresSafeArea()
            
            if showDetails {
                CardFullView(gene: selectedGeneCard ?? WikiDataPreview.preview, namespace: namespace, showDetails: $showDetails, geneName: "")
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
    
    var cards: some View {
        ForEach(allGenes) { gene in
            CardView(gene: gene, namespace: namespace)
                .padding()
                .onTapGesture {
                    withAnimation(.openCard) {
                        selectedGeneCard = gene
                        showDetails =  true
                    }
                }
        }
    }
    
}

#if DEBUG
struct DNAStrandHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
