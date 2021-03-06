//
//  Repository.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/18.
//  Copyright © 2018年 watanabe-yudai. All rights reserved.
//

struct Repository: Entity {
	let id: Int
	let name: String
	let fullName: String
	let owner: User
    let stargazersCount: Int
    let url: String
    
    enum CodingKeys : String, CodingKey {
        case id
        case name
        case fullName = "full_name"
        case owner
        case stargazersCount = "stargazers_count"
        case url = "html_url"
    }
}
