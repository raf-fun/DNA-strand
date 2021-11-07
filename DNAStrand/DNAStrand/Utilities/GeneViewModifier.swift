//
//  GeneViewModifier.swift
//  DNAStrand
//
//  Created by Aaron Paulson on 2021-11-06.
//

import SwiftUI

struct GeneViewModifier: ViewModifier {
    var geneName: String
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .cornerRadius(10)
            .overlay(
                Text(geneName)
                    .font(.system(size: 20, weight: .bold))
                    .foregroundColor(Color.blue)
                    .opacity(0.6),
                    alignment: .bottom)
    }
}

extension View {
    func geneViewModifier(for geneName: String) -> some View {
        modifier(GeneViewModifier(geneName: geneName))
    }
}
