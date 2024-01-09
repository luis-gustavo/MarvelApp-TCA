//
//  MockComics.swift
//  MarvelAppTCATests
//
//  Created by Luis Gustavo on 09/01/24.
//

@testable import MarvelAppTCA

struct MockComics {
  static let data: [Comic] = [
    .init(
      id: 0,
      title: "Spider Man #1",
      thumbnail: .init(path: "https://google.com", extension: "jpg"),
      issueNumber: 1,
      prices: [
        .init(price: 1.99, type: "$")
      ]
    ),
    .init(
      id: 1,
      title: "Iron Man #1",
      thumbnail: .init(path: "https://google.com", extension: "jpg"),
      issueNumber: 1,
      prices: [
        .init(price: 2.99, type: "$")
      ]
    ),
    .init(
      id: 2,
      title: "Captain America #1",
      thumbnail: .init(path: "https://google.com", extension: "jpg"),
      issueNumber: 1,
      prices: [
        .init(price: 4.99, type: "$")
      ]
    )
  ]
}
