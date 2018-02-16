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
        
        // Load article in webView
        Articlewebview.loadRequest(URLRequest(url: URL(string: url!)!))
        
    }

    
    
    override func motionEnded(_ motion: UIEventSubtype, with event: UIEvent?) {
        
        //Share article to external applications when shake gesture
        if motion == .motionShake {
            
            let activityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
            
            
        }
    }

}
