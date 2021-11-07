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
                // Organized by
                Section {
                    Link(destination: URL(string: "https://swiftuijam.com")!) {
                        Image("jamHeader")
                            .resizable()
                            .renderingMode(.original)
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .cornerRadius(12)
                    }
                }
                
                // About the Team
                Section {
                    Text("This app was created for a group of people that got together for a weekend to play and learn with SwiftUI during the SwiftUIJam Nov2021.\n\nDifferent timezones and expertise make the whole experience more challenging.")
                        .lineLimit(nil)
                        .font(.footnote)
                } header: {
                    Text("About the Team")
                }
                
                // Contributors
                Section {
                    Contributor(name: "R4S3C", twitterHandle: "R4S3CDev")
                    Contributor(name: "Neil Jain", twitterHandle: "neilgotnothing", website: "https://neilsultimatelab.github.io")
                    Contributor(name: "Rafael Carter", twitterHandle: "@DevRafaelC", website: "https://github.com/raf-fun")
                    Contributor(name: "Djallil Elkebir", twitterHandle: "@DjallilOS", website: "https://github.com/Djallil14")

                    Contributor(name: "Jarod Paulson")
                    Contributor(name: "Sheikh Bayazaid")
                } header: {
                    Text("Contributors")
                }
                
                // Third-Party Libraries
                Section {
                    Link(destination: URL(string: "https://github.com/scinfu/SwiftSoup")!) {
                        Text("SwiftSoup")
                    }
                    
                    Link(destination: URL(string: "https://github.com/lorenzofiamingo/SwiftUI-CachedAsyncImage")!) {
                        Text("CachedAsyncImage")
                    }
                } header: {
                    Text("Libraries")
                }
                
                // App icon
                Section {
                    Link(destination: URL(string: "https://apps.apple.com/app/bakery-simple-icon-creator/id1575220747")!) {
                        Text("Bakery - Simple Icon Creator")
                    }
                } header: {
                    Text("App Icon")
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
        HStack(alignment: .center, spacing: 12) {
            Text(name)
                .font(.subheadline)
            
            if let twitterHandle = twitterHandle {
                Link(destination: URL(string: "https://twitter.com/\(twitterHandle)")!) {
                    Text("Twitter")
                        .font(.caption2)
                }
                .buttonStyle(.bordered)
            }
            
            if let website = website {
                Link(destination: URL(string: "\(website)")!) {
                    Text("Website")
                        .font(.caption2)
                }
                .buttonStyle(.bordered)
            }
        }
    }
}

#if DEBUG
struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
            .preferredColorScheme(.dark)
    }
}
#endif
