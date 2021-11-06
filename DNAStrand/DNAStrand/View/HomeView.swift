//
//  HomeView.swift
//  DNAStrand
//
//  Created by Cesar Palma on 2021-11-06.
//

import SwiftUI

struct HomeView: View {
    @State private var showDetails = false
    var body: some View {
        NavigationView {
            ScrollView {
                
                ForEach(1..<5) { card in
                    CardView.example
                        .padding()
                        .onTapGesture {
                            showDetails =  true
                        }
                    
                }
            }
            .navigationTitle("DNAStrand")
            .statusBar(hidden: showDetails)
            .fullScreenCover(isPresented: $showDetails) {
              CardFullView()
            }

        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
