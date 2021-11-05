//
//  CardView.swift
//  DNAStrand
//
//  Created by Rafael Carter on 11/5/21.
//

import SwiftUI

struct CardView: View {
    var DisplayText: String
    var DisplayTextColor: Color
    var Background: Image
    var body: some View {
        ZStack {
            Background
                .resizable()
                .scaledToFit()
                .cornerRadius(15)
            
            VStack {
                Text(DisplayText)
                    .bold()
                    .foregroundColor(DisplayTextColor)
                    .shadow(color: .black, radius: 1)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
        .shadow(radius: 10)
    }
    
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(DisplayText: "Name of Gene", DisplayTextColor: .green,
                 Background: Image("Insulin"))
    }
}
