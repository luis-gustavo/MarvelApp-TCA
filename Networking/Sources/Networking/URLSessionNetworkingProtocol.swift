//
//  URLSessionNetworkingProtocol.swift
//
//
//  Created by Luis Gustavo on 09/01/24.
//

import Foundation

public protocol URLSessionNetworkingProtocol {
  func request(endPoint: EndPoint) async throws -> NetworkResponse
}
