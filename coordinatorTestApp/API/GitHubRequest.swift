//
//  GitHubRequest.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/18.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
}

protocol GitHubRequest {
	var baseUrl: URL { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var queryItems: [URLQueryItem] { get }
	var body: Encodable? { get }
}

extension GitHubRequest {
	var baseUrl: URL {
		return URL(string: "https://api.github.com")!
	}
}
