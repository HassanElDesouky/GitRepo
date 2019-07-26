//
//	Basic.swift
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Basic : Codable {
  
  let password : String?
  let username : String?
  
  enum CodingKeys: String, CodingKey {
    case password = "password"
    case username = "username"
  }
  
  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)
    password = try values.decodeIfPresent(String.self, forKey: .password)
    username = try values.decodeIfPresent(String.self, forKey: .username)
  }
}
