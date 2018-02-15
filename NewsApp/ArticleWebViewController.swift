//
//  ArticleWebViewController.swift
//  NewsApp
//
//  Created by MACBOOKPRO on 15/02/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class ArticleWebViewController: UIViewController {

    @IBOutlet weak var Articlewebview: UIWebView!
    var url: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Articlewebview.loadRequest(URLRequest(url: URL(string: url!)!))
        
    }

   

}
