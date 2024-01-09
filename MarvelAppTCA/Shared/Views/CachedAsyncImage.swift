//
//  CachedAsyncImage.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import SwiftUI

/// A view for asynchronously loading and caching images from an optional URL.
public struct CachedAsyncImage<Content: View, Placeholder: View>: View {
  @StateObject private var imageLoader: ImageLoader
  private let content: (Image) -> Content
  private let placeholder: () -> Placeholder

  /// Initializes the `CachedAsyncImage`.
  /// - Parameters:
  ///   - url: The optional URL of the image to load.
  ///   - content: A closure returning the content to display once the image is loaded.
  ///   - placeholder: A closure returning the content to display as the placeholder.
  public init(
    url: URL?,
    @ViewBuilder content: @escaping (Image) -> Content,
    @ViewBuilder placeholder: @escaping () -> Placeholder) {
      self.content = content
      self.placeholder = placeholder
      _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }

  public var body: some View {
    if let image = imageLoader.image {
      content(Image(uiImage: image))
    } else {
      placeholder()
        .onAppear {
          Task {
            await imageLoader.load()
          }
        }
    }
  }
}

/// A class responsible for loading images from an optional URL and caching them.
class ImageLoader: ObservableObject {
  @Published var image: UIImage?

  private let url: URL?
  private var cache: URLCache

  /// Initializes the `ImageLoader` with an optional URL.
  /// - Parameter url: The optional URL of the image to load.
  init(url: URL?) {
    self.url = url
    self.cache = URLCache.shared
  }

  /// Loads the image asynchronously from the specified optional URL and caches it if not already cached.
  func load() async {
    guard let url = url else { return }
    let request = URLRequest(url: url)

    // Checks if the image is in the cache
    if let data = cache.cachedResponse(for: request)?.data, let image = UIImage(data: data) {
      DispatchQueue.main.async {
        self.image = image
      }
    } else {
      do {
        let (data, response) = try await URLSession.shared.data(for: request)
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
          return
        }

        if let image = UIImage(data: data) {
          DispatchQueue.main.async {
            self.image = image
          }

          let cachedData = CachedURLResponse(response: httpResponse, data: data)
          cache.storeCachedResponse(cachedData, for: request)
        }
      } catch {
        print("Error loading image: \(error.localizedDescription)")
      }
    }
  }
}
