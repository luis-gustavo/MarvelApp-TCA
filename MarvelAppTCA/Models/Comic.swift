//
//  Comic.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import Foundation

struct Comic: Codable, Hashable, Identifiable {
  let id: Int
  let title: String
  let thumbnail: ImageURL
  let issueNumber: Int
  let prices: [Price]
}
