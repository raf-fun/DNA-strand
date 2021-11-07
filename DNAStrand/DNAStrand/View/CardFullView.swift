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
        }
    }
}

#if DEBUG
struct CardFullView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        Group {
            CardFullView(gene: WikiData.preview, namespace: namespace, showDetails: .constant(true))
            CardFullView(gene: WikiData.preview, namespace: namespace, showDetails: .constant(true))
                .preferredColorScheme(.dark)
        }
    }
}
#endif
