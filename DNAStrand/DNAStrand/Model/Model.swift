//
//  Model.swift
//  DNAStrand
//
//  Created by Cesar Palma on 2021-11-06.
//

import SwiftUI

struct WikiDataPreview: Identifiable {
    let pageid: Int
    let title: String
    let thumbnail: Image
    let extract: String

    var id: Int { pageid }
    
    static var preview: WikiDataPreview {
        WikiDataPreview(pageid: 1, title: "Gene Name 01", thumbnail: Image("card_background_01"), extract: "Extract 01\nStranded. Yes, she was now the first person ever to land on Venus, but that was of little consequence. Her name would be read by millions in school as the first to land here, but that celebrity would never actually be seen by her. She looked at the control panel and knew there was nothing that would ever get it back into working order. She was the first and it was not clear this would also be her last.")
    }
    
    static var geneDataExample = [
        WikiDataPreview(pageid: 1, title: "Gene Name 01", thumbnail: Image("card_background_01"), extract: "Extract 01\nStranded. Yes, she was now the first person ever to land on Venus, but that was of little consequence. Her name would be read by millions in school as the first to land here, but that celebrity would never actually be seen by her. She looked at the control panel and knew there was nothing that would ever get it back into working order. She was the first and it was not clear this would also be her last."),
        WikiDataPreview(pageid: 2, title: "Gene Name 02", thumbnail: Image("card_background_02"), extract: "Extract 02\nStranded. Yes, she was now the first person ever to land on Venus, but that was of little consequence. Her name would be read by millions in school as the first to land here, but that celebrity would never actually be seen by her. She looked at the control panel and knew there was nothing that would ever get it back into working order. She was the first and it was not clear this would also be her last."),
        WikiDataPreview(pageid: 3, title: "Gene Name 03", thumbnail: Image("card_background_03"), extract: "Extract 03\nStranded. Yes, she was now the first person ever to land on Venus, but that was of little consequence. Her name would be read by millions in school as the first to land here, but that celebrity would never actually be seen by her. She looked at the control panel and knew there was nothing that would ever get it back into working order. She was the first and it was not clear this would also be her last."),
        WikiDataPreview(pageid: 4, title: "Gene Name 04", thumbnail: Image("card_background_04"), extract: "Extract 04\nStranded. Yes, she was now the first person ever to land on Venus, but that was of little consequence. Her name would be read by millions in school as the first to land here, but that celebrity would never actually be seen by her. She looked at the control panel and knew there was nothing that would ever get it back into working order. She was the first and it was not clear this would also be her last.")
    ]
}
