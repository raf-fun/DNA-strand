//
//  URLSession+ImageChache.swift
//  DNAStrand
//
//  Created by Neil Jain on 11/7/21.
//

import Foundation

extension URLCache {
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}
