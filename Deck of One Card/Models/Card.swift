//
//  Card.swift
//  Deck of One Card
//
//  Created by Apple on 3/10/20.
//  Copyright © 2020 Jordan Crandell. All rights reserved.
//

import Foundation

struct Card: Codable {
    var image: String
    var value: String
    var suit: String
}

struct TopLevelObject: Codable {
    var cards: [Card]
}




//struct Pokemon: Codable {
//    let name: String
//    let id: Int
//    let height: Int
//    let weight: Int
//    //new JSON object means new swift project
//    let sprites: SpriteObject
//}
//
//struct SpriteObject: Codable {
//    let classicSpriteURL: URL
//    
//    enum CodingKeys: String, CodingKey {
//        case classicSpriteURL = "image"
//    }
//}











//card.image.classicImageURL
