//
//  CardFullView.swift
//  DNAStrand
//
//  Created by Rafael Carter on 11/6/21.
//

import SwiftUI

struct CardFullView: View {
    
    var gene: WikiDataPreview
    var namespace: Namespace.ID
    
    @Binding var showDetails: Bool
    @State var geneName: String
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Color(UIColor.systemGroupedBackground)
            
            ScrollView(showsIndicators: false) {
                VStack(alignment: .leading) {
                    gene.thumbnail
                        .resizable()
                        .edgesIgnoringSafeArea(.top)
                        .aspectRatio(contentMode: .fill)
                        .frame(maxHeight: 300, alignment: .top)
                        .mask {
                            Rectangle()
                            
                        }
                        .matchedGeometryEffect(id: "image\(gene.id)", in: namespace)
                    
                    Text(gene.title.uppercased())
                        .font(.largeTitle)
                        .foregroundColor(.primary.opacity(0.7))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding([.horizontal, .bottom])
                    
                        .matchedGeometryEffect(id: "title\(gene.id)", in: namespace)
                    
                    Text(gene.extract)
                        .foregroundColor(.primary.opacity(0.7))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .multilineTextAlignment(.leading)
                        .padding(.horizontal)
                    
                    Spacer()
                }
            }
            
            CloseButton(showDetails: $showDetails)
        }
        .ignoresSafeArea()
        .statusBar(hidden: true)
        .background(
            Rectangle().matchedGeometryEffect(id: "frame\(gene.id)", in: namespace)
        )
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

struct TitleParagraphDisplayView: View {
    var body: some View {
        VStack {
            Text("Title inside Gene:")
                .bold()
                .frame( maxWidth: .infinity, alignment: .leading)
                .shadow(radius: 1, x: 5, y: 5)
                .padding(.bottom, 0.5)
            
            Text("Stranded. Yes, she was now the first person ever to land on Venus, but that was of little consequence. Her name would be read by millions in school as the first to land here, but that celebrity would never actually be seen by her. She looked at the control panel and knew there was nothing that would ever get it back into working order. She was the first and it was not clear this would also be her last.")
        }
        .foregroundColor(.white.opacity(0.8))
        .padding()
    }
}

#if DEBUG
struct CardFullView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        Group {
            CardFullView(gene: WikiDataPreview.preview, namespace: namespace, showDetails: .constant(true), geneName: "")
            CardFullView(gene: WikiDataPreview.preview, namespace: namespace, showDetails: .constant(true), geneName: "")
                .preferredColorScheme(.dark)
        }
        //CardFullView(geneName: "Gene name")
    }
}
#endif
