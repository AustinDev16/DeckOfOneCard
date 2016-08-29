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
    
    
    
    static func drawCards(numberOfCards: Int, completion: (cards: [Card]) -> Void){

        guard let url = self.baseURL else { fatalError("URLoptional is nil")}
        let urlParameters = ["count": "\(numberOfCards)"]
        
        
        NetworkController.performRequestForURL(url, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            //turn data into cards
            guard let data = data,
                jsonAnyObject = try? NSJSONSerialization.JSONObjectWithData(data, options: .AllowFragments),
            jsonDictionary = jsonAnyObject as? [String:AnyObject],
            cardDictionaries = jsonDictionary["cards"] as? [[String: AnyObject]]
                else {
                    completion(cards: [])
                    return
                }
            
            let cards = cardDictionaries.flatMap({ Card(dictionary: $0) })
            
            completion(cards: cards)
            
        }
        
    }
    
}
