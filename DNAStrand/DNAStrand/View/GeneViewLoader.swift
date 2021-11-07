//
//  GeneViewLoader.swift
//  DNAStrandAPP
//
//  Created by Djallil Elkebir on 2021-11-05.
//

import SwiftUI

struct GeneViewLoader: View {
    @ObservedObject var geneVM: GeneViewModel
    @Namespace var namespace

    let showGene: Gene
    @State private var selectedGene: WikiAPIResult?
    
    var body: some View {
        ZStack {
            switch geneVM.dataPhase {
            case .empty:
                ProgressView()
                
            case .success(let genes):
                ScrollView {
                    VStack {
                        ForEach(genes, id: \.query.pages.resultData.title) { gene in
                            GeneView(gene: gene, namespace: namespace)
                                .onTapGesture {
                                    self.selectedGene = gene
                                }
                        }
                    }
                }
                
            case .failure(let error):
                Text("Error: \(error.localizedDescription)")
            }
            if let selectedGene = selectedGene {
                OtherGeneDetailView(gene: selectedGene, namespace: namespace) {
                    self.selectedGene = nil
                }
                .transition(.scale)
                .animation(.default, value: selectedGene)
            }
        }
    }
}
struct GeneViewLoader_Previews: PreviewProvider {
    static var previews: some View {
        GeneViewLoader(geneVM: GeneViewModel(), showGene: .Insulin)
    }
}

