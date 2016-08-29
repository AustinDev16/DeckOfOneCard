//
//  ViewController.swift
//  DeckOfOneCard
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cardLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CardController.drawCards(1) { (cards) in
            
        }
        
    }

    // MARK: - Actions
    
    @IBAction func drawACardButtonTapped(sender: AnyObject) {
        
        CardController.drawCards(1) { (cards) in
            guard let card = cards.first else {return}
            
            ImageController.imageForURL(card.imageString, completion: { (image) in
                self.cardImageView.image = image
                    self.cardLabel.text = "\(card.value) of \(card.suit)"
            })
            
            
            
        }
        
    }
 


}

