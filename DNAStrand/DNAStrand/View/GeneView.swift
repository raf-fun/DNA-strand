//
//  ContentView.swift
//  DNAStrandAPP
//
//  Created by Djallil Elkebir on 2021-11-05.
//

import SwiftUI

struct GeneView: View {
    let gene: WikiAPIResult
    var namespace: Namespace.ID

    var wikidata: WikiData {
        gene.query.pages.resultData
    }
    
    @State var formatedURL: String = ""
    var body: some View {
        VStack {
            ZStack {
                Group {
                    if let image = wikidata.thumbnail {
                        AsyncImage(url: URL(string: image.formattedImageLink(width: 300))) { image in
                            image
                                .resizable()
                                .matchedGeometryEffect(id: "image\(wikidata.id)", in: namespace)
                        } placeholder: {
                            ProgressView()
                        }
                    } else {
                        Color.secondary
                    }
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .overlay(
                LinearGradient(colors: [Color.gray.opacity(0.1), Color.gray.opacity(0.5)], startPoint: .top, endPoint: .bottom)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            )
            .overlay(
                Text(wikidata.title)
                    .font(.title)
                    .bold()
                    .foregroundColor(.black)
                    .padding()
                    .matchedGeometryEffect(id: "title\(wikidata.title)", in: namespace)
                ,
                alignment: .bottomLeading
            )
            .cornerRadius(18)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    @Namespace static var namespace

    static var previews: some View {
        GeneView(gene: WikiAPIResult.sampleUser, namespace: namespace)
    }
}
