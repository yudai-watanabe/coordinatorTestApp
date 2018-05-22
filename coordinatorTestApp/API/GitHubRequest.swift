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
    associatedtype Response: Decodable
    
	var baseUrl: URL { get }
	var path: String { get }
	var method: HTTPMethod { get }
	var queryItems: [URLQueryItem] { get }
}

extension GitHubRequest {
	var baseUrl: URL {
		return URL(string: "https://api.github.com")!
	}
    
    func buildURLRequest() -> URLRequest {
        let url = baseUrl.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        switch method {
        case .get:
            components?.queryItems = queryItems
        default:
            fatalError("Unsupported method \(method)")
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue
        
        return urlRequest
    }
    
    func response(from data: Data, urlResponse: URLResponse) throws -> Response {
        let decoder = JSONDecoder()
        
        if case (200..<300)? = (urlResponse as? HTTPURLResponse)?.statusCode {
            // JSONからモデルをインスタンス化
            return try decoder.decode(Response.self, from: data)
        } else {
            // JSONからAPIエラーをインスタンス化
            throw try decoder.decode(GitHubAPIError.self, from: data)
        }
    }
}
