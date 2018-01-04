//
//  TableViewCell.swift
//  HiddenChallengeCodeIOS
//
//  Created by mac on 04/01/2018.
//  Copyright © 2018 mac. All rights reserved.
//


import UIKit

class TableViewCell: UITableViewCell {
    
  
    
    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
 
    @IBOutlet weak var desLabel: UILabel!

    @IBOutlet weak var loginLabel: UILabel!

    @IBOutlet weak var startLabel: UILabel!

    
    
    
    
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
