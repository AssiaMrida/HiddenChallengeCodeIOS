//
//  DetailViewController.swift
//  HiddenChallengeCodeIOS
//
//  Created by mac on 04/01/2018.
//  Copyright © 2018 mac. All rights reserved.
//


import UIKit

class DetailViewController: UIViewController {
    
    
    
    
    //current controller IBOutlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var desLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var startLabel: UILabel!

    //data from previous controller
    var nameString:String!
    var desString:String!
    var imageString:String!
    var startInt:String!
    var loginString:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func updateUI() {
        self.nameLabel.text = nameString
        self.desLabel.text = desString
        self.loginLabel.text = loginString
        self.startLabel.text = startInt
        let imgURL = URL(string:imageString)
        let data = NSData(contentsOf: (imgURL)!)
        self.imageView.image = UIImage(data: data! as Data)
    }
}
