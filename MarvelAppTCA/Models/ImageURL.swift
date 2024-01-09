//
//  Image.swift
//  MarvelAppTCA
//
//  Created by Luis Gustavo on 09/01/24.
//

import Foundation

struct ImageURL: Codable, Hashable {

  // MARK: - Properties
  var url: URL? { URL(string: "\(path).\(`extension`)") }
  private let path: String
  private let `extension`: String

  init(path: String, extension: String) {
    self.path = path
    self.`extension` = `extension`
  }
}
