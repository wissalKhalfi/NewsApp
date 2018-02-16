//
//  ViewController.swift
//  NewsApp
//
//  Created by MACBOOKPRO on 15/02/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit
import Alamofire
import NVActivityIndicatorView

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource , NVActivityIndicatorViewable {
    
   
    @IBOutlet weak var CategoriesMenu: UIStackView!
    @IBOutlet weak var tableArticles: UITableView!
    var articles: [Article]? = []
    var ShowCategoriesIsVisible = false
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        CategoriesMenu.isHidden = true
        fetchArticles(typeArticle: "all")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableArticles.reloadData()
    }

  
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableArticles.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        
        
        //print(self.articles?[indexPath.item].description)
        /*let dateFormatter = DateFormatter()
        let tempLocale = dateFormatter.locale // save locale temporarily
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        let dateP = self.articles?[indexPath.item].publishedAt
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm:ss"
        dateFormatter.locale = tempLocale // reset the locale
        let dateString = dateFormatter.string(from: dateP!)
        print("date publication: ",dateString)*/
        //cell.ArticlePublishDate.text = dateString
        if ((self.articles?[indexPath.item].urlToImage) != nil) {
           cell.ImgArticle.downloadImage(from: (self.articles?[indexPath.item].urlToImage!)!)
        } else {
            let image : UIImage = UIImage(named: "NotAvailable")!
            cell.ImgArticle.image = image
            
        }
        
        if(self.articles?[indexPath.item].title != nil ){
            cell.TitleArticle.text = self.articles?[indexPath.item].title
        }else{
            cell.TitleArticle.text =  "No title available"
        }
        
        if(self.articles?[indexPath.item].articleDescription != nil ){
            cell.DescArticle.text = self.articles?[indexPath.item].articleDescription
        }else{
            cell.DescArticle.text =  "No description available"
        }
        
        if(self.articles?[indexPath.item].author != nil ){
            cell.AuthorArticle.text = self.articles?[indexPath.item].author
        }else{
             cell.AuthorArticle.text =  "No Author available"
        }
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return self.articles?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webVC = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web") as! ArticleWebViewController
        webVC.url = self.articles?[indexPath.item].url
        self.present(webVC, animated: true, completion: nil)
    }
    
    func fetchArticles(typeArticle:String){
        
        var urll:String = "https://newsapi.org/v2/top-headlines?country=fr&apiKey=46935084a6114cd9aa4b7585387a5c60"
        
        if(typeArticle == "all")
        {
        
        urll = "https://newsapi.org/v2/top-headlines?country=fr&apiKey=46935084a6114cd9aa4b7585387a5c60"
        }
        else  if(typeArticle == "business") {
        urll = "https://newsapi.org/v2/top-headlines?country=fr&category=business&apiKey=46935084a6114cd9aa4b7585387a5c60"
        }
        else  if(typeArticle == "entertaiment") {
            urll = "https://newsapi.org/v2/top-headlines?country=fr&category=entertainment&apiKey=46935084a6114cd9aa4b7585387a5c60"
        }
        else  if(typeArticle == "health") {
            urll = "https://newsapi.org/v2/top-headlines?country=fr&category=health&apiKey=46935084a6114cd9aa4b7585387a5c60"
        }
        else  if(typeArticle == "science") {
            urll = "https://newsapi.org/v2/top-headlines?country=fr&category=science&apiKey=46935084a6114cd9aa4b7585387a5c60"
        }
        else  if(typeArticle == "sports") {
            urll = "https://newsapi.org/v2/top-headlines?country=fr&category=sports&apiKey=46935084a6114cd9aa4b7585387a5c60"
        }
        else  if(typeArticle == "tech") {
            urll = "https://newsapi.org/v2/top-headlines?country=fr&category=technology&apiKey=46935084a6114cd9aa4b7585387a5c60"
        }
        
        
        
        
        
        
        
        let size = CGSize(width: 30, height: 30)
        
        self.startAnimating(size, message: "Loading...")
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1.5) {
            NVActivityIndicatorPresenter.sharedInstance.setMessage("Fetching...")
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
            self.stopAnimating()
        }
        
        if (self.articles?.count != nil)
        {
            self.articles?.removeAll()
        }
        
       Alamofire.request(urll, method: .get, parameters: nil, encoding: JSONEncoding.default)
            .responseJSON {
                
                response in
                //debugPrint(response)
                switch response.result {
                case .success(let JSON):
                   // print("successss")
                    let response = JSON as! NSDictionary
                   // print(response)
                    for item in response.object(forKey: "articles") as! NSArray  {
                    
                        let article = Article()
                        
                        let title = (item as AnyObject).object(forKey: "title") as? String
                        let author = (item as AnyObject).object(forKey: "author") as? String
                        let desc = (item as AnyObject).object(forKey: "description") as? String
                        let publishedAt = (item as AnyObject).object(forKey: "publishedAt") as? String
                        let url = (item as AnyObject).object(forKey: "url") as? String
                        let urlToImage = (item as AnyObject).object(forKey: "urlToImage") as? String
                            
                            article.author = author
                            article.articleDescription = desc
                            article.title = title!
                            article.url = url
                            article.urlToImage = urlToImage
                            let dateFormatter = DateFormatter()
                            dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
                            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
                            let date = dateFormatter.date(from: publishedAt!)!
                            article.publishedAt = date
                        self.articles?.append(article)
                        
                    }
                    
                     self.tableArticles.reloadData()
                    
                    
                case .failure(let error):
                    self.displayAlertMessage(messageToDisplay: "Request failed with error: \(error)")
                }
        }
        
    }
    
    
    @IBAction func Business(_ sender: AnyObject) {
       // print ("buisiness")
        ShowCategoriesIsVisible = false
        CategoriesMenu.isHidden = true
        fetchArticles(typeArticle: "business")
    }
    
    @IBAction func entertaiment(_ sender: AnyObject) {
         //print ("entertaiment")
        ShowCategoriesIsVisible = false
        CategoriesMenu.isHidden = true
        fetchArticles(typeArticle: "entertaiment")
    }
    
    @IBAction func health(_ sender: AnyObject) {
        ShowCategoriesIsVisible = false
        CategoriesMenu.isHidden = true
        fetchArticles(typeArticle: "health")
    }
    
    @IBAction func science(_ sender: AnyObject) {
        ShowCategoriesIsVisible = false
        CategoriesMenu.isHidden = true
        fetchArticles(typeArticle: "science")
    }
    
  
    @IBAction func sports(_ sender: AnyObject) {
        ShowCategoriesIsVisible = false
        CategoriesMenu.isHidden = true
        fetchArticles(typeArticle: "sports")
    }
    
    @IBAction func tech(_ sender: AnyObject) {
        ShowCategoriesIsVisible = false
        CategoriesMenu.isHidden = true
        fetchArticles(typeArticle: "tech")
    }
    
    @IBAction func ShowCategories(_ sender: AnyObject) {
        
        if !ShowCategoriesIsVisible {
           
            ShowCategoriesIsVisible = true
            CategoriesMenu.isHidden = false
            CategoriesMenu.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
            //tableArticles.isHidden = true
        } else {
            ShowCategoriesIsVisible = false
            CategoriesMenu.isHidden = true
            //tableArticles.isHidden = false
        }
        
        UIView.animate(withDuration: 0.2, delay: 0.0, options: .curveEaseIn, animations: {
            self.view.layoutIfNeeded()
        }) { (animationComplete) in
            print("The animation is complete!")
        }
    }
    
    func displayAlertMessage(messageToDisplay: String)
    {
        let alertController = UIAlertController(title: "NewsApp Error", message: messageToDisplay, preferredStyle: .alert)
        
        let OKAction = UIAlertAction(title: "OK", style: .default) { (action:UIAlertAction!) in
   
        }
        
        alertController.addAction(OKAction)
        
        self.present(alertController, animated: true, completion:nil)
    }
    
    
}

extension UIImageView {
    
    func downloadImage(from url: String){
    
        let urlRequest = URLRequest(url: URL(string: url)!)
        
        let task = URLSession.shared.dataTask(with: urlRequest) { (data,response,error) in
            
            if error != nil {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data!)
            }
        }
        task.resume()
    }
}
