//
//  ComicsFeatureTests.swift
//  MarvelAppTCATests
//
//  Created by Luis Gustavo on 09/01/24.
//

import ComposableArchitecture
import XCTest
@testable import MarvelAppTCA

@MainActor
final class ComicsFeatureTests: XCTestCase {
  func testOnInitialFetch() async {
    let store = TestStore(initialState: ComicsFeature.State()) {
      ComicsFeature()
    } withDependencies: {
      $0.comicsClient.fetchComics = { queryParameters in
        ComicData(
          offset: 0,
          limit: 20,
          total: 100,
          count: 0,
          results: MockComics.data
        )
      }
    }

    await store.send(.onAppear) {
      $0.isLoading = true
    }

    await store.receive(\.comics, timeout: .seconds(1)) {
      $0.isLoading = false
      $0.comics = MockComics.data
      $0.queryParameters.offset = 20
    }
  }

  func testInfiniteScrollingFlow() async {
    let store = TestStore(initialState: ComicsFeature.State()) {
      ComicsFeature()
    } withDependencies: {
      $0.comicsClient.fetchComics = { queryParameters in
        ComicData(
          offset: 0,
          limit: 20,
          total: 100,
          count: 0,
          results: MockComics.data
        )
      }
    }

    await store.send(.onAppear) {
      $0.isLoading = true
    }

    await store.receive(\.comics, timeout: .seconds(1)) {
      $0.isLoading = false
      $0.comics = MockComics.data
      $0.queryParameters.offset = 20
    }

    await store.send(.onAppear) {
      $0.isLoading = true
    }

    await store.receive(\.comics, timeout: .seconds(1)) {
      $0.isLoading = false
      $0.comics = MockComics.data + MockComics.data
      $0.queryParameters.offset = 40
    }
  }
}
