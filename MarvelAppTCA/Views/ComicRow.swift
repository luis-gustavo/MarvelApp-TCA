//
//  ComicRow.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import SwiftUI

struct ComicRow: View {
  let comic: Comic

  var body: some View {
    HStack {
      CachedAsyncImage(url: comic.thumbnail.url) { image in
        image
          .resizable()
          .frame(width: 80)
          .clipShape(RoundedRectangle(cornerRadius: 20))
      } placeholder: {
        ProgressView()
          .frame(width: 80)
      }
      Spacer()
      Text(comic.title)
        .font(.title3)
      Spacer()
    }
  }
}

struct ComicRowPreviews: PreviewProvider {
  static var previews: some View {
    ComicRow(comic: .mock)
      .previewLayout(.fixed(width: 300, height: 100))
  }
}

private extension Comic {
  static let mock = Comic(
    id: 0,
    title: "Marvel Previews (2017)",
    thumbnail: .init(path: "http://i.annihil.us/u/prod/marvel/i/mg/f/20/4bc69f33cafc0", extension: "jpg"),
    issueNumber: 0,
    prices: [
      .init(price: 0, type: "printPrice")
      ]
  )
}

