//
//  URLSessionNetworking.swift
//
//
//  Created by Luis Gustavo on 09/01/24.
//

import Foundation

public struct URLSessionNetworking: URLSessionNetworkingProtocol {
  // MARK: - Properties
  public static let shared = URLSessionNetworking()

  // MARK: - Init
  private init() { }

  // MARK: - NetworkLayerProtocol
  public func request(endPoint: EndPoint) async throws -> NetworkResponse {
    guard let url = endPoint.url else {
      throw NetworkError.unableToCreateURL
    }

    guard let request = endPoint.createRequest() else {
      throw NetworkError.queryParameters(url, [:])
    }

    let (data, response) = try await URLSession.shared.data(for: request)

    guard let httpResponse = response as? HTTPURLResponse else {
      throw NetworkError.notHTTPURLResponse
    }

    guard let statusCode = HTTPStatusCode(rawValue: httpResponse.statusCode) else {
      throw NetworkError.unknownStatusCode(httpResponse.statusCode)
    }

    return NetworkResponse(
      data: data,
      status: statusCode,
      response: httpResponse,
      request: request
    )
  }
}
