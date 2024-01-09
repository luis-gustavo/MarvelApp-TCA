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
    var comics: IdentifiedArrayOf<Comic> = []
  }

  enum Action {

  }

  var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {

      }
    }
  }
}
