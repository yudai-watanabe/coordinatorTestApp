//
//  gitHubAPI.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/18.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation

final class GitHubAPI {
	struct SearchRepositories: GitHubRequest {
		let keyword: String
		
		typealias Response = SearchResponse<Repositry>
		
		var path: String {
			return "/search/repositries"
		}
		
		var method: HTTPMethod {
			return .get
		}
		
		var queryItems: [URLQueryItem] {
			return  [URLQueryItem(name: "q", value: keyword)]
		}
		
	}
}


