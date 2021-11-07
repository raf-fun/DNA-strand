//
//  GeneDetailView.swift
//  DNAStrandAPP
//
//  Created by Djallil Elkebir on 2021-11-06.
//

import SwiftUI

struct OtherGeneDetailView: View {
    @Environment(\.dismiss) var dismiss
    let gene: WikiAPIResult
    var namespace: Namespace.ID
    var onCompletion: (()->Void)?
    
    var geneData: WikiData {
        gene.query.pages.resultData
    }
    
    @State var geneURL: WikiData? = nil
    var body: some View {
        ZStack(alignment:.top) {
            ScrollView {
                VStack(alignment:.leading, spacing: 0) {
                    if let image = geneData.thumbnail {
                        AsyncImage(url: URL(string: image.formattedImageLink(width: 500))) { image in
                            image
                                .resizable()
                                .aspectRatio(1, contentMode: .fit)
                                .matchedGeometryEffect(id: "image\(geneData.id)", in: namespace)
                        } placeholder: {
                            ProgressView()
                        }
                        .overlay(
                            LinearGradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        )
                        .cornerRadius(12)
                        .overlay(
                            Text(geneData.title)
                                .bold()
                                .font(.title)
                                .padding(),
                                //.matchedGeometryEffect(id: "title\(geneData.title)", in: namespace),
                            alignment: .bottomLeading
                        )
                    }
                    Text("Description").font(.headline)
                        .padding()
                    Text(geneData.firstParagraph ?? "")
                        .padding()
                    HStack {
                        Spacer()
                        Button(action: {
                            withAnimation {
                                geneURL = geneData
                            }
                        }){
                            Label("Show me more", systemImage: "safari")
                                .padding(8)
                        }.buttonStyle(.borderedProminent)
                        Spacer()
                    }.sheet(item: $geneURL){gene in
                        GeneWikipediaWebView(url: gene.wikipediaLink)
                    }
                    Spacer()
                }
            }
        }
        .overlay(
            Button(action: {
                dismiss()
                self.onCompletion?()
            }){
                Image(systemName: "xmark")
            }.tint(.black)
                .padding(8)
                .background(.thinMaterial)
                .clipShape(Circle())
                .padding(24)
                .position(x: 40, y: 60),
            alignment: .topLeading
        )
        .background(
            Color(.systemBackground)
                .ignoresSafeArea(.all, edges: .all)
        )
        .edgesIgnoringSafeArea(.top)
        .navigationBarHidden(true)
    }
}

struct GeneDetailView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        OtherGeneDetailView(gene: WikiAPIResult.sampleUser, namespace: namespace)
    }
}
