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
    VStack {
      Spacer()
      CachedAsyncImage(url: comic.thumbnail.url) { image in
        image
          .resizable()
          .frame(height: 200)
          .clipShape(RoundedRectangle(cornerRadius: 20))
      } placeholder: {
        ProgressView()
      }
      Spacer()
      Text(comic.title)
        .font(.title3)
        .multilineTextAlignment(.center)
      Spacer()
    }
  }
}

struct ComicRowPreviews: PreviewProvider {
  static var previews: some View {
    ComicRow(comic: .mock)
      .previewLayout(.fixed(width: 200, height: 250))
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

