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
    
    let cardController = CardController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cardLabel.text = ""
        
        
        
    }

    // MARK: - Actions
    
    @IBAction func drawACardButtonTapped(sender: AnyObject) {
        
     cardController.fetchCard(1) { (cards) in
        // fetch image
        guard let card = cards.first else { return }
        ImageController.downloadImage(card.imageString, completion: { (image) in
            
            dispatch_async(dispatch_get_main_queue(), {
                self.cardLabel.text = "\(card.value) of \(card.suit)"
                self.cardImageView.image = image
            })
            
            
        })
        
        }
        
    }
 


}

