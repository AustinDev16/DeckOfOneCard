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
    
    static func downloadImage(imageString: String, completion: (image: UIImage?) -> Void){
        let url = NSURL(string: imageString)!
        
        NetworkController.performRequestForURL(url, httpMethod: .Get) { (data, error) in
            guard let data = data,
                let image = UIImage(data: data) else { completion(image: nil); return}
            
            completion(image: image)
        }
        
    }
}