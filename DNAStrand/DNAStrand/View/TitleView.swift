//
//  TitleView.swift
//  DNAStrand
//
//  Created by Aaron Paulson on 2021-11-07.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        HStack {
            Text("In")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.blue)
            + Text("g")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.green)
            + Text("e")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.yellow)
            + Text("n")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.blue)
            + Text("e")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.red)
            + Text("ious")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.blue)
            
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
    }
}


