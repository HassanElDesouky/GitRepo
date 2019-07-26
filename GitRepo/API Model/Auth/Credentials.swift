//
//	RootClass.swift
//
//  Created by Hassan El Desouky on 7/27/19.
//  Copyright © 2019 Hassan El Desouky. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation

struct Credentials : Codable {
	let accessToken : AccessToken?
	let basic : Basic?
	let token : Token?

	enum CodingKeys: String, CodingKey {
		case accessToken = "access_token"
		case basic
		case token
	}
	
    init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		accessToken = try values.decodeIfPresent(AccessToken.self, forKey: .accessToken)
		basic = try values.decodeIfPresent(Basic.self, forKey: .basic)
		token = try values.decodeIfPresent(Token.self, forKey: .token)
	}
}
