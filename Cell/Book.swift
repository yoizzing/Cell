//
//  Book.swift
//  Cell
//
//  Created by ktds 06 on 2017. 8. 17..
//  Copyright © 2017년 CJOliveNetworks. All rights reserved.
//

import Foundation
import UIKit

class Book {
    var title:String
    var writer:String
    var publisher:String
    var coverImage:UIImage
    var price:Int
    var description:String
    var url:String
    
    init(title:String,
         writer:String,
         publisher:String,
         coverImage:UIImage,
         price:Int,
         description:String,
         url:String){
        
        self.title       = title
        self.writer      = writer
        self.publisher   = publisher
        self.coverImage  = coverImage
        self.price       = price
        self.description = description
        self.url         = url
        
    }
    
    
}