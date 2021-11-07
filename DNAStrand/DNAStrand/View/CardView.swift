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
            gene.thumbnail
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity)
                .frame(height: 300)
                .disabled(true)
                .matchedGeometryEffect(id: "image\(gene.id)", in: namespace)
                .matchedGeometryEffect(id: "frame\(gene.id)", in: namespace)
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
            CardView(gene: WikiData.preview, namespace: namespace)
                .padding()
            CardView(gene: WikiData.preview, namespace: namespace)
                .preferredColorScheme(.dark)
                .padding()
        }
    }
}
#endif



