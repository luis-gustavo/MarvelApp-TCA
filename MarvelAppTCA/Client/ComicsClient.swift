//
//  ComicsClient.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import ComposableArchitecture
import Foundation
import Networking

struct ComicsClient {
  var fetchComics: (ComicQueryParameters) async throws -> ComicData
}

extension ComicsClient: DependencyKey {
  static let liveValue = Self(
    fetchComics: { queryParameters in
      let response = try await URLSessionNetworking.shared.request(endPoint: ComicEndpoint.comics(queryParameters: queryParameters))
      let comicsResponse = try JSONDecoder().decode(ComicResponse.self, from: response.data)
      return comicsResponse.data
    }
  )
}

extension DependencyValues {
  var comicsClient: ComicsClient {
    get { self[ComicsClient.self] }
    set { self[ComicsClient.self] = newValue }
  }
}
