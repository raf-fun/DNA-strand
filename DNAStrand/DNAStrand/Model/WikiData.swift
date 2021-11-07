//
//  WikiData.swift
//  DNAStrandAPP
//
//  Created by Djallil Elkebir on 2021-11-05.
//

import Foundation
import SwiftSoup

struct WikiData: Codable, Identifiable, Equatable {
    let pageid, ns: Int
    let title: String
    let thumbnail: WikiImage?
    let extract: String
    
    // comforming to Identifiable
    var id: Int {
        pageid
    }
}

// Formatting
extension WikiData {
    var wikipediaLink: URL {
        let url = URL(string: "https://en.wikipedia.org/wiki/\(title)")
        guard let unwrappedURL = url else {
            return URL(string:"https://en.wikipedia.org/wiki/")!
        }
        return unwrappedURL
    }
    var firstParagraph: String? {
        let html = extract
        let utfHTML = String(html.utf8)
        do {
            // parsing our document with SwiftSoup
            let doc: Document = try SwiftSoup.parse(utfHTML)
            // getting all the h2 tags
            let paragraphs = try doc.body()?.select("p")
            let firstParagraphe = try paragraphs?.first()?.text()
            return firstParagraphe
            
        } catch Exception.Error(let type, let message) {
            print("Message: \(message), Type: \(type)")
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

//let pngs: Elements = try doc.select("img[src$=.png]") to get png images in the article
// i got to look for parsing the span tag that is wrapping the titles
