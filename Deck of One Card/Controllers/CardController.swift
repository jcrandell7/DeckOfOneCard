//
//  CardController.swift
//  Deck of One Card
//
//  Created by Apple on 3/10/20.
//  Copyright © 2020 Jordan Crandell. All rights reserved.
//

import UIKit
class CardController {

        //URL Constants
        static let baseURL = URL(string: "https://deckofcardsapi.com/api/deck/new/draw/?count=1")
        static let cardEndPoint = ""
        
        //Fetch Requests
        static func fetchCard(
                                 completion: @escaping (Result<Card, CardError>) -> Void) {
            // 1 - URL
            guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
            // 2 - Data Task
            URLSession.shared.dataTask(with: baseURL) { (data, _, error) in
                // 3 - Error Handling
                if let error = error {
                    print(error, error.localizedDescription)
                    return completion(.failure(.thrown(error)))
                }
                // 4 - Check for Data
                guard let data = data else { return completion(.failure(.noData))}
                // 5 - Decode Data
                do {
                    let decoder = JSONDecoder()
                    let topLevelObject = try decoder.decode(TopLevelObject.self, from: data)
                    let card = topLevelObject.cards[0]
                    return completion(.success(card))
                }catch{
                    print(error, error.localizedDescription)
                    return completion(.failure(.thrown(error)))
                }
                
            }.resume()
        }
        
        static func fetchImage (for card: Card,
                                 completion: @escaping (Result<UIImage, CardError>) -> Void) {
            // 1 - URL the sprites for these already have the URL for them built in
            guard let imageURL = URL(string: card.image) else {return}
            print(imageURL)
            // 2 - Data Task
            URLSession.shared.dataTask(with: imageURL) { (data, _, error) in
                // 3 - Error Handling
                if let error = error{
                    print(error, error.localizedDescription)
                    return completion(.failure(.thrown(error)))
                }
                // 4 - Check for Data
                guard let data = data else {return completion(.failure(.noData))}
                // 5 - decode Data for an image we don't have to do a "do, catch" because it has a failable initilizer built in.
                guard let image = UIImage(data: data) else {return completion(.failure(.unableToDecode))}
                return completion(.success(image))
                
            }.resume()
        }
    }
