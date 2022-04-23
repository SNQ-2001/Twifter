//
//  error.swift
//  
//
//  Created by 宮本大新 on 2022/04/23.
//

import Foundation

struct Errors: Codable, Error {
    let errors: [ErrorElement]
}

struct ErrorElement: Codable, Error {
    let code: Int
    let message: String
}
