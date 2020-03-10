//
//  UIViewControllerExtension.swift
//  Deck of One Card
//
//  Created by Apple on 3/10/20.
//  Copyright © 2020 Jordan Crandell. All rights reserved.
//

import UIKit
extension UIViewController {
    func presentErrorToUser(localizedError: LocalizedError) {
        
        // Feel free to customize the alert controller.
        let alertController = UIAlertController(title: "Error", message: localizedError.errorDescription, preferredStyle: .actionSheet)
        let dismissAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(dismissAction)
        present(alertController, animated: true)
    }
}
