//
//  Article.swift
//  NewsApp
//
//  Created by MACBOOKPRO on 15/02/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class Article: NSObject {
   
    public var title: String = ""
    public var author: String?
    public var urlToImage: String?
    public var articleDescription: String?
    public var url: String?
    public var publishedAt: Date?
    
    

    override var  description : String {
        return "title: \(self.title)" +
            "author: \(self.author)" +
            "urlToImage: \(self.urlToImage)\n" +
            "articleDescription: \(self.articleDescription)\n" +
            "url : \(self.url)\n"
        
        
    }
    
}
