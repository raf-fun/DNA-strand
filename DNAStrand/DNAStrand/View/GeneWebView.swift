//
//  GeneWebView.swift
//  DNAStrand
//
//  Created by Rafael Carter on 11/7/21.
//

import SafariServices
import SwiftUI

struct GeneWebView: UIViewControllerRepresentable {
    
    let url: URL

    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {
        
    }
    func makeUIViewController(context: Context) -> SFSafariViewController {
        let safariVC = SFSafariViewController(url: self.url)
        return safariVC
    }
}
