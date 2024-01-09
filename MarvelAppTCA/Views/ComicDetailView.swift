//
//  ComicDetailView.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import SwiftUI

struct ComicDetailView: View {
  let comic: Comic
  private var prices: String {
    comic.prices.map { "\($0.typeTitle): \($0.price)" }.joined(separator: "\n")
  }

  var body: some View {
    VStack {
      VStack {
        CachedAsyncImage(url: comic.thumbnail.url) { image in
          image
            .resizable()
        } placeholder: {
          ProgressView()
        }
        Text(prices)
        HStack {
          Button {

          } label: {
            Image(systemName: "heart")
              .frame(width: 40, height: 40)
              .background(.quaternary, in: Circle())
              .foregroundStyle(.primary)
          }
          Button {

          } label: {
            Image(systemName: "cart")
              .frame(width: 40, height: 40)
              .background(.quaternary, in: Circle())
              .foregroundStyle(.primary)
          }
        }
        Button(Localizable.buy.localized) {
          
        }
        .buttonStyle(.borderedProminent)
        .frame(height: 40)
        .clipShape(RoundedRectangle(cornerRadius: 10))
      }
      .navigationTitle(comic.title)
    }
    .padding()
  }
}

#Preview {
  NavigationStack {
    ComicDetailView(comic: .mock)
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
