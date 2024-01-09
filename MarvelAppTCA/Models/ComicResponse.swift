//
//  ComicResponse.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import Foundation

struct ComicResponse: Codable, Hashable {
  let data: ComicData
}

struct ComicData: Codable, Hashable {
  let offset: Int
  let limit: Int
  let total: Int
  let count: Int
  let results: [Comic]
}
