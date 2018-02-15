//
//  ArticleCell.swift
//  NewsApp
//
//  Created by MACBOOKPRO on 15/02/2018.
//  Copyright © 2018 ESPRIT. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

    @IBOutlet weak var ImgArticle: UIImageView!
    @IBOutlet weak var TitleArticle: UILabel!
    @IBOutlet weak var DescArticle: UILabel!
    @IBOutlet weak var AuthorArticle: UILabel!
    
    @IBOutlet weak var ArticlePublishDate: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
