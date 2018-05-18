//
//  SearchResponse.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/18.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation

struct SearchResponse<Item: Decodable> {
	let totalCount: Int
	let items: [Item]
	
	enum CodingKeys: String, CodingKey {
		case totalCount = "total_count"
		case items
	}
}
