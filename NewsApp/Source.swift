//
//  Source.swift
//  NewsApp
//
//  Created by MACBOOKPRO on 17/02/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class Source: NSObject {
    
    public var id: String = ""
    public var name: String?
    public var descriptionSource: String?
    public var url: String?
    public var category: String?
    public var language: String?
    public var country: String?
    
    
    
    override var  description : String {
        return "id: \(self.id)" +
            "name: \(self.name)" +
            "descriptionSource: \(self.descriptionSource)\n" +
            "url: \(self.url)\n" +
            "category : \(self.category)\n"  +
            "language : \(self.language)\n"   +
        "country : \(self.country)\n"
        
        
    }

}
