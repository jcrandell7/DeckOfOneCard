//
//  ViewController.swift
//  Deck of One Card
//
//  Created by Apple on 3/10/20.
//  Copyright © 2020 Jordan Crandell. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    @IBOutlet weak var cardViewImageView: UIImageView!
    @IBOutlet weak var labelLabelView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func fetchImageAndUpdateViews(for card: Card) {
        
        CardController.fetchImage(for: card) { [weak self] result in
             DispatchQueue.main.async {
            switch result {
            case .success(let image):
                self?.labelLabelView.text = "\(card.value) of \(card.suit)"
                self?.cardViewImageView.image = image
            case .failure(let error):
                "\(error.localizedDescription)"
                
            }
        }
    }
    }
    @IBAction func buttonTapped(_ sender: Any) {
        CardController.fetchCard { [weak self] (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateViews(for: card)
                case .failure(let error):
                self?.presentErrorToUser(localizedError: error)
            }
        }
    }
   }
    
}
