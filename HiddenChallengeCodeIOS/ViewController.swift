//
//  ViewController.swift
//  HiddenChallengeCodeIOS
//
//  Created by mac on 04/01/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    


    @IBOutlet weak var tableView: UITableView!
    var nameArray = [String]()
    var desArray = [Any]()
    var loginArray = [String]()
    var startArray = [Double]()
    var imgURLArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell
        cell.nameLabel.text = nameArray[indexPath.row]
        
        cell.desLabel.text = desArray[indexPath.row] as? String
        cell.loginLabel.text = loginArray[indexPath.row]
        
        cell.startLabel.text = String(format:"%.1f", startArray[indexPath.row])+"K"
        
        
        let imgURL = NSURL(string: imgURLArray[indexPath.row])
        
        if imgURL != nil {
            let data = NSData(contentsOf: (imgURL as URL?)!)
            cell.imgView.image = UIImage(data: data! as Data)
        }
        
        return cell
    }
    
    ///for showing next detailed screen with the downloaded info
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        vc.imageString = imgURLArray[indexPath.row]
        vc.nameString = nameArray[indexPath.row]
        vc.loginString = loginArray[indexPath.row]
        vc.startInt = String(format:"%.1f", startArray[indexPath.row])+"K"
        vc.desString = desArray[indexPath.row] as! String
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

