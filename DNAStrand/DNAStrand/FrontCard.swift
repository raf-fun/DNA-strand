//
//  FrontCard.swift
//  DNAStrand
//
//  Created by Cesar Palma on 2021-11-05.
//

import SwiftUI

struct FrontCard: View {
       
    var body: some View {
        VStack {
            ThumbnailView()
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
                .padding(20)
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 8) {
                // TODO: Replace Text with the result from the API call
                Text("Title")
                    .font(.title).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white)
                
                Text("Short Description".uppercased())
                    .font(.footnote).bold()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white.opacity(0.7))
                
                Text("Begining of the extract...")
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(.white.opacity(0.7))
            }
            .padding(20)
            .background(
                Rectangle()
                    .fill(.ultraThinMaterial)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .cornerRadius(30)
                    .blur(radius: 30)
            )
        }
        .frame(height: 300)
        .background(
            Image("card_background_01")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .disabled(true)
        )
        .mask(
            RoundedRectangle(cornerRadius: 30)
        )
        .padding()
    }
        
}


struct ThumbnailView: View {
   
    var body: some View {
        // TODO: Replace thumbnail with the result from the API call
        Image("thumbnail")
            .resizable()
            .frame(width: 26, height: 26)
            .padding(8)
            .background(.ultraThinMaterial)
            .cornerRadius(26)
    }
}

#if DEBUG
struct FrontCard_Previews: PreviewProvider {

    static var previews: some View {
        FrontCard()
            .preferredColorScheme(.dark)
    }
}

#endif


