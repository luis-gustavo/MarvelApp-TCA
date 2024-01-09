//
//  ComicsFeature.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import ComposableArchitecture

@Reducer
struct ComicsFeature {
  struct State: Equatable {
    var comics: [Comic] = []
    var isLoading = false
    var queryParameters = ComicQueryParameters(offset: 0, limit: 20)

    init(comics: [Comic] = []) {
      self.comics = comics
    }
  }

  enum Action {
    case onAppear
    case comics([Comic])
  }

  @Dependency(\.comicsClient) var comicsClient

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .onAppear:
        guard !state.isLoading else { return .none }
        state.isLoading = true
        return .run { [queryParameters = state.queryParameters] send in
          try await send(.comics(comicsClient.fetchComics(queryParameters).results))
        }
      case let .comics(newComics):
        state.comics.append(contentsOf: newComics)
        state.queryParameters.offset += state.queryParameters.limit
        state.isLoading = false
        return .none
      }
    }
  }
}
