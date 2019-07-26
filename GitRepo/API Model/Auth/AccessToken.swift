//
//	AccessToken.swift
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct AccessToken : Codable {
	let accessToken : String?
	let key : String?
    
	enum CodingKeys: String, CodingKey {
		case accessToken = "access_token"
		case key = "key"
	}
	
    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		accessToken = try values.decodeIfPresent(String.self, forKey: .accessToken)
		key = try values.decodeIfPresent(String.self, forKey: .key)
	}
}
