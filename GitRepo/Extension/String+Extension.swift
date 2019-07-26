//
//  String+Extension.swift
//  GitRepo
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//

import Foundation

extension String {
  func fromBase64() -> String? {
    guard let data = Data(base64Encoded: self, options: Data.Base64DecodingOptions(rawValue: 0)) else {
      return nil
    }
    return String(data: data as Data, encoding: String.Encoding.utf8)
  }
  
  func toBase64() -> String? {
    guard let data = self.data(using: String.Encoding.utf8) else {
      return nil
    }
    return data.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
  }
}
