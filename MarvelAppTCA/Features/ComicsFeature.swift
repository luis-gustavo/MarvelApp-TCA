//
//  HeroesFeature.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import ComposableArchitecture

struct Hero: Hashable, Codable, Identifiable {
  
}

@Reducer
struct HeroesFeature {
  struct State: Equatable {

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
