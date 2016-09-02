//
//  CardController.swift
//  DeckOfOneCard
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation

class CardController {
    
    static let baseURL = NSURL(string: "http://deckofcardsapi.com/api/deck/new/draw/")
    
    func fetchCard(numberOfCards: Int, completion: (card: [Card]) -> Void){
        
        NetworkController.performRequestForURL(CardController.baseURL!, httpMethod: .Get, urlParameters: ["count":"\(numberOfCards)"]) { (data, error) in
            guard let data = data,
            let jsonDictionary = (try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments)) as? [String:AnyObject],
            let cardDictionaries = jsonDictionary["cards"] as? [[String:AnyObject]] else { completion(card: []); return}
            
            let cardsArray = cardDictionaries.flatMap({ Card(dictionary: $0)})
            
            completion(card: cardsArray)
            
        }
        
    }
    

    
}
