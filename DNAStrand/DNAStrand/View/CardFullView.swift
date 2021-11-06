//
//  CardFullView.swift
//  DNAStrand
//
//  Created by Rafael Carter on 11/6/21.
//

import SwiftUI

struct CardFullView: View {
    var body: some View {
        ZStack(alignment: .topTrailing) {
            LinearGradient(colors: [Color.purple, Color.blue], startPoint: .leading, endPoint: .bottomTrailing)
            
            GeometryReader { geometry in
                ScrollView(showsIndicators: false) {
                    VStack {
                        Image("Insulin")
                            .resizable()
                            .scaledToFit()
                            .cornerRadius(10)
                            .overlay(
                                Text("Gene Name").shadow(color: .black, radius: 1), alignment: .bottom)
                        
                        ForEach(1..<5) { _ in
                            TitleParagraphDisplayView()
                        }
                        Spacer()
                    }
                }
                
            }
            ZStack {
                Circle()
                    .foregroundStyle(.thinMaterial)
                    .frame(width: 30, height: 30)
                    .padding()
                    
                Image(systemName: "xmark")
                    .foregroundColor(.gray)
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
            
            Text("Stranded. Yes, she was now the first person ever to land on Venus, but that was of little consequence. Her name would be read by millions in school as the first to land here, but that celebrity would never actually be seen by her. She looked at the control panel and knew there was nothing that would ever get it back into working order. She was the first and it was not clear this would also be her last.")
        }
        .padding()
    }
}

struct CardFullView_Previews: PreviewProvider {
    static var previews: some View {
        CardFullView()
    }
}
