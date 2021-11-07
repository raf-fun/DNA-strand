//
//  CardView.swift
//  DNAStrand
//
//  Created by Rafael Carter on 11/5/21.
//

import SwiftUI

struct CardView: View {
    
    var gene: WikiData
    var namespace: Namespace.ID
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            
            Text(gene.title)
                .bold()
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .shadow(color: .black, radius: 1)
                .matchedGeometryEffect(id: "title\(gene.id)", in: namespace)
            
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 40)
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .background(
            Group {
                if let urlString = gene.thumbnail?.formattedImageLink(width: 500) {
                    AsyncImage(url: URL(string: urlString)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .disabled(true)
                            .matchedGeometryEffect(id: "image\(gene.id)", in: namespace)
                            .overlay(
                                LinearGradient(colors: [Color.gray.opacity(0), Color.gray.opacity(0.1)], startPoint: .top, endPoint: .bottom)
                            )
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Color.gray.opacity(0.1)
                }
            }
        )
        .mask(
            RoundedRectangle(cornerRadius: 30)
        )
    }
  
}

#if DEBUG
struct CardView_Previews: PreviewProvider {
    @Namespace static var namespace
    
    static var previews: some View {
        Group {
            //CardView(gene: WikiData.preview, namespace: namespace)
            //    .padding()
            //CardView(gene: WikiData.preview, namespace: namespace)
            //    .preferredColorScheme(.dark)
            //    .padding()
        }
    }
}
#endif



