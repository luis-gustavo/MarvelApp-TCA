//
//  Comic.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import Foundation

struct Comic: Codable, Hashable, Identifiable {
  // MARK: - Properties
  let id: Int
  let title: String
  let thumbnail: Image
  let issueNumber: Int
  let prices: [Price]

  // MARK: - Hashable
  static func == (lhs: Comic, rhs: Comic) -> Bool {
    lhs.hashValue == rhs.hashValue
  }

  func hash(into hasher: inout Hasher) {
    hasher.combine(id)
    hasher.combine(title)
    hasher.combine(thumbnail.url)
    hasher.combine(issueNumber)
  }
}
