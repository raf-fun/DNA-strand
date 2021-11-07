//
//  DNAShape.swift
//  DNAStrand
//
//  Created by Djallil Elkebir on 2021-11-06.
//

import SwiftUI

struct DNAShapeRetryLoaderView: View {
    @State var fullRotation: CGFloat = 0
    var body: some View {
        ZStack{
            Circle()
                .stroke(lineWidth: 6)
        DotDNAShape()
                .frame(width: 30, height: 60)
            .rotationEffect(.degrees(fullRotation))
            .onAppear{
                withAnimation(Animation.linear(duration: 1).repeatForever(autoreverses: false)){
                    fullRotation += 360
                }
            }
            .onDisappear{
                withAnimation{
                fullRotation = 0
                }
            }
        }
        .frame(width: 80, height: 80)
    }
}

struct DNAShapeRetryLoaderView_Previews: PreviewProvider {
    static var previews: some View {
        DNAShapeRetryLoaderView()
    }
}
