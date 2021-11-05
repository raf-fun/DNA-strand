//
//  ContentView.swift
//  DNAStrand
//
//  Created by Neil Jain on 11/5/21.
//

import SwiftUI
import DNAStrandService

struct ContentView: View {
    @Environment(\.service) var service
    @State private var error: AppError?
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .alert(item: $error) { error in
                error.alert()
            }
            .onAppear {
                fetchAPI()
            }
    }
    
    func fetchAPI() {
        self.service.fetchDNAInfo { result in
            switch result {
            case .success(let item):
                print(item)
                return
            case .failure(let error):
                self.error = error
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.service, Service.defaultValuePreview)
    }
}
#endif
