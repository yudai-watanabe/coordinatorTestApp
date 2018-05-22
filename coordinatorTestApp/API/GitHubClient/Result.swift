//
//  Result.swift
//  coordinatorTestApp
//
//  Created by watanabe-yudai on 2018/05/22.
//

import Foundation

enum Result<T, Error : Swift.Error> {
    case success(T)
    case failure(Error)
    
    init(value: T) {
        self = .success(value)
    }
    
    init(error: Error) {
        self = .failure(error)
    }
}

