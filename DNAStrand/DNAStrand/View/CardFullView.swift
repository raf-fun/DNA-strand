//
//  CardFullView.swift
//  DNAStrand
//
//  Created by Rafael Carter on 11/6/21.
//

import SwiftUI

struct CardFullView: View {
    
    var gene: WikiData
    var namespace: Namespace.ID
    
    @Binding var showDetails: Bool
    @State private var isVisible: Bool = false
    @State var geneURL: WikiData? = nil
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(UIColor.systemGroupedBackground)
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        CardView(gene: gene, namespace: namespace, cornerRadius: 0)
                            .matchedGeometryEffect(id: "card\(gene.id)", in: namespace)
                        
                        Text(gene.firstParagraph ?? "")
                            .foregroundColor(.primary.opacity(0.7))
                            .frame(maxWidth: .infinity, alignment: .center)
                            .multilineTextAlignment(.leading)
                            .padding(.horizontal)
                            .opacity(isVisible ? 1 : 0)
                            .animation(.easeIn(duration: 0.45).delay(0.1), value: isVisible)
                        HStack {
                            Spacer()
                            Button(action: {
                                withAnimation {
                                    geneURL = gene
                                }
                            }){
                                Label("Show me more", systemImage: "safari")
                                    .padding(8)
                            }.buttonStyle(.borderedProminent)
                            Spacer()
                        }.sheet(item: $geneURL){gene in
                            GeneWebView(url: gene.wikipediaLink)
                        }
                        Spacer()
                    }
                }
            }
            .ignoresSafeArea()
            .statusBar(hidden: true)
            .background(
                Rectangle()
                    .fill(Color(.systemGroupedBackground))
                    .opacity(isVisible ? 1 : 0)
                    .animation(.default, value: isVisible)
                    .matchedGeometryEffect(id: "frame\(gene.id)", in: namespace)
            )
            .overlay(
                CloseButton(showDetails: $showDetails).padding(.top, 0),
                alignment: .topTrailing
            )
        }
        .ignoresSafeArea()
        .statusBar(hidden: true)
        .onAppear {
            self.isVisible = true
        }
        .onDisappear {
            self.isVisible = false
        }
    }
    
}


// MARK - CloseButton
struct CloseButton: View {
    @Environment(\.dismiss) var dismiss
    @Binding var showDetails: Bool
    
    var body: some View {
        Button {
            withAnimation(.closeCard) {
                showDetails =  false
            }
            dismiss()
        } label: {
            ZStack {
                Circle()
                    .foregroundStyle(.thinMaterial)
                    .frame(width: 30, height: 30)
                    .padding()
                
                Image(systemName: "xmark")
                    .foregroundColor(.primary)
            }
        }.ignoresSafeArea()
    }
}

#if DEBUG
struct CardFullView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        Group {
            //CardFullView(gene: WikiData.preview, namespace: namespace, showDetails: .constant(true))
            //CardFullView(gene: WikiData.preview, namespace: namespace, showDetails: .constant(true))
                //.preferredColorScheme(.dark)
        }
        //CardFullView(geneName: "Gene name")
    }
}
#endif
