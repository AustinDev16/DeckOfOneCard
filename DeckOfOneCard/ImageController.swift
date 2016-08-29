//
//  ImageController.swift
//  DeckOfOneCard
//
//  Created by Austin Blaser on 8/29/16.
//  Copyright © 2016 Austin Blaser. All rights reserved.
//

import Foundation
import UIKit
class ImageController {
    
    static func imageForURL(urlString: String, completion: (image: UIImage?)-> Void){
        
        guard let url = NSURL(string: urlString) else { fatalError("Image url optional is nil")}
            
            NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
                guard let data = data else { completion(image: nil); return}
                
                
                dispatch_async(dispatch_get_main_queue(), {
                    completion(image: UIImage(data: data))
                })
                
        
    }
    
}
}