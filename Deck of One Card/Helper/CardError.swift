//
//  CardError.swift
//  Deck of One Card
//
//  Created by Apple on 3/10/20.
//  Copyright © 2020 Jordan Crandell. All rights reserved.
//

import Foundation

enum CardError: LocalizedError {
    
    // what we see
    case invalidURL
    case thrown(Error)
    case noData
    case unableToDecode
    //what the user sees
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Unable to reach server."
        case .thrown(let error):
            return error.localizedDescription
        case .noData:
            return "Server responded with no data"
        case .unableToDecode:
            return "Server responded with bad data."
        }
    }
}
