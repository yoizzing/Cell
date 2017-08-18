//
//  Book.swift
//  Cell
//
//  Created by ktds 06 on 2017. 8. 17..
//  Copyright © 2017년 CJOliveNetworks. All rights reserved.
//

import Foundation
import UIKit

class Book: NSObject, NSCoding {
    var title:String
    var writer:String?
    var publisher:String?
    var coverImage:UIImage?
    var price:Int?
    var desc:String?
    var url:String?
    
    init(title:String,
         writer:String?,
         publisher:String?,
         coverImage:UIImage?,
         price:Int?,
         desc:String?,
         url:String?){
        
        self.title       = title
        self.writer      = writer
        self.publisher   = publisher
        self.coverImage  = coverImage
        self.price       = price
        self.desc        = desc
        self.url         = url
        
    }
    
    
    convenience init(title:String, writer:String){
        
        self.init(title:title,
                  writer:writer,
                  publisher:nil,
                  coverImage:nil,
                  price:nil,
                  desc:nil,
                  url:nil)
    }
    
    // 파일의 내용을 인스턴스화 시킬 때 호출되는 내용
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.title, forKey:"title")
        aCoder.encode(self.writer, forKey:"writer")
        aCoder.encode(self.publisher, forKey:"publisher")
        aCoder.encode(self.coverImage, forKey:"coverImage")
        aCoder.encode(self.price, forKey:"price")
        aCoder.encode(self.desc, forKey:"desc")
        aCoder.encode(self.url, forKey:"url")
    }
    
    // 특정 인스턴스를 파일로 만들 때 호출되는 내용
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.writer = aDecoder.decodeObject(forKey: "writer") as! String
        self.publisher = aDecoder.decodeObject(forKey: "publisher") as! String
        self.coverImage = aDecoder.decodeObject(forKey: "coverImage") as! UIImage
        self.price = aDecoder.decodeObject(forKey: "price") as! Int
        self.desc = aDecoder.decodeObject(forKey: "desc") as! String
        self.url = aDecoder.decodeObject(forKey: "url") as! String
    }
    
//    init(title:String, writer:String, publisher:String){
//        self.title = title
//        self.writer = writer
//        self.publisher = publisher
//        self.coverImage = UIImage(named: "22")
//        self.price = nil
//        self.description = nil
//        self.url = nil
//    }
    
}
