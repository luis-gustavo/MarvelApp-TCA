//
//  ComicsView.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import SwiftUI

struct ComicsView: View {
  let comics: [Comic]

  var body: some View {
    List {
      ForEach(comics) { comic in
        ComicRow(comic: comic)
          .frame(height: 80)
      }
    }
  }
}

#Preview {
  ComicsView(comics: Comic.mockData)
}

private extension Comic {
  static let mockData: [Comic] = [
    .init(
      id: 0,
      title: "Marvel Previews (2017)",
      thumbnail: .init(path: "http://i.annihil.us/u/prod/marvel/i/mg/b/40/image_not_available", extension: "jpg"),
      issueNumber: 0,
      prices: [
        .init(price: 0, type: "printPrice")
      ]
    ),
    .init(
      id: 323,
      title: "Ant-Man (2003) #2",
      thumbnail: .init(path: "http://i.annihil.us/u/prod/marvel/i/mg/f/20/4bc69f33cafc0", extension: "jpg"),
      issueNumber: 2,
      prices: [
        .init(price: 2.99, type: "printPrice")
      ]
    ),
    .init(
      id: 1590,
      title: "Official Handbook of the Marvel Universe (2004) #9 (THE WOMEN OF MARVEL)",
      thumbnail: .init(path: "http://i.annihil.us/u/prod/marvel/i/mg/9/b0/4c7d666c0e58a", extension: "jpg"),
      issueNumber: 9,
      prices: [
        .init(price: 3.99, type: "printPrice")
      ]
    )
  ]
}
