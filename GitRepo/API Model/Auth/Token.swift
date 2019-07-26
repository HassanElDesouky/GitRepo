//
//	Token.swift
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Token : Codable {
	let key : String?
	let token : String?
    
	enum CodingKeys: String, CodingKey {
		case key = "key"
		case token = "token"
	}
	
    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		key = try values.decodeIfPresent(String.self, forKey: .key)
		token = try values.decodeIfPresent(String.self, forKey: .token)
	}
}
