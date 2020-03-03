//
//  Feed.swift
//  WeFit_storyboard
//
//  Created by Cristina Barclay on 2/25/20.
//  Copyright © 2020 Cristina Barclay. All rights reserved.
//

import Foundation
import UIKit


class Feed {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var goal: String
    var completion: UIImage
   
   
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?, goal: String, completion: UIImage) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }

        // The rating must be between 0 and 5 inclusively
        
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.goal = goal
        self.completion = completion
      
        
    }
}
