//
//  CardView.swift
//  DNAStrand
//
//  Created by Rafael Carter on 11/5/21.
//

import SwiftUI
import CachedAsyncImage

struct CardView: View {
    
    var gene: WikiData
    var namespace: Namespace.ID
    var cornerRadius: CGFloat = 30
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Spacer()
            HStack {
                Text(gene.title)
                    .bold()
                    .font(.title)
                    .foregroundStyle(LinearGradient(colors: [.accentColor, .accentColor.opacity(0.8)], startPoint: .leading, endPoint: .trailing))
                    .padding(.vertical, 6)
                    .padding(.horizontal, 12)
                    .background(
                        .thinMaterial
                    )
                    .cornerRadius(12)
                Spacer()
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 20)
        .frame(maxWidth: .infinity)
        .frame(height: 300)
        .background(
            Group {
                if let urlString = gene.thumbnail?.formattedImageLink(width: 500) {
                    CachedAsyncImage(url: URL(string: urlString)) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                            .frame(height: 300)
                            .disabled(true)
                            .overlay(
                                LinearGradient(colors: [Color.gray.opacity(0), Color.black.opacity(0.2)], startPoint: .top, endPoint: .bottom)
                            )
                            .background(Color.white)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Color.gray.opacity(0.1)
                }
            }
        )
        .mask(
            RoundedRectangle(cornerRadius: cornerRadius)
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



