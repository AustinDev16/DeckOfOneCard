//
//  Card.swift
//  DeckOfOneCard
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

class Card {
    
    private let kSuit = "suit"
    private let kValue = "value"
    private let kImageString = "image"
    
    
    let suit : String
    let value: String
    let imageString: String
    
    init?(dictionary: [String: AnyObject]){
        
        guard let suit = dictionary[kSuit] as? String,
         value = dictionary[kValue] as? String,
        imageString = dictionary[kImageString] as? String else {return nil}
        
        self.suit = suit
        self.value = value
        self.imageString = imageString
        
    }
    
}
