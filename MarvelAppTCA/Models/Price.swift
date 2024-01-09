//
//  Price.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import Foundation

struct Price: Codable, Hashable {

  // MARK: - Type
  private enum `Type`: String {
    case printPrice, digitalPurchasePrice

    var title: String {
      switch self {
      case .printPrice:
        return Localizable.price.localized
      case .digitalPurchasePrice:
        return Localizable.digitalPrice.localized
      }
    }
  }

  // MARK: - Properties
  var typeTitle: String {
    (`Type`(rawValue: type) ?? .printPrice).title
  }
  let price: Float
  private let type: String

  init(price: Float, type: String) {
    self.price = price
    self.type = type
  }
}
