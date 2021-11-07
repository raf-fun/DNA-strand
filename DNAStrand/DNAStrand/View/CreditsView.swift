//
//  CreditsView.swift
//  DNAStrand
//
//  Created by Cesar Palma on 2021-11-06.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        NavigationView {
            Form {
                // About the Team
                Section {
                    Text("This app was created for a random group of people that get together to play/learn with SwiftUI during the SwiftUIJam Nov2021.\n\nDifferent timezones and expertise make the whole experience more challenging.")
                        .lineLimit(nil)
                        .font(.footnote)
                } header: {
                    Text("About the Team")
                }

                // Contributors
                Section {
                    Contributor(name: "R4S3C", twitterHandle: "@R4S3CDev", website: "http://daysonsite.app")
                    Contributor(name: "Neil Jain", twitterHandle: "@neilgotnothing", website: "https://neilsultimatelab.github.io")
                    Contributor(name: "Djallil Elkebir", twitterHandle: "@DjallilOS", website: "https://Djallil14.github.com")
                } header: {
                    Text("Contributors")
                }

            }
            .navigationTitle("Credits")
        }
    }
}


struct Contributor: View {
    var name: String
    var twitterHandle: String?
    var website: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(name)
                .font(.subheadline)
                
            
            HStack {
                if let twitterHandle = twitterHandle {
                    Label {
                        Text(twitterHandle)
                            .foregroundColor(.primary.opacity(0.7))
                    } icon: {
                        Image("twitter")
                            .resizable()
                            .renderingMode(.template)
                            .frame(width: 20, height: 20, alignment: .trailing)
                            .foregroundColor(.blue.opacity(0.7))
                    }
                    .font(.footnote)

                }
            }
            
            HStack {
                if let website = website {
                    Label {
                        Text(website)
                            .foregroundColor(.primary.opacity(0.7))
                    } icon: {
                        Image(systemName: "network")
                            .resizable()
                            .frame(width: 20, height: 20, alignment: .trailing)
                            .foregroundColor(.blue.opacity(0.7))
                    }
                    .font(.footnote)
                }
            }
        }
    }
}

#if DEBUG
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
#endif
