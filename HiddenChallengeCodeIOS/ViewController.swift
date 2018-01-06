//
//  ViewController.swift
//  HiddenChallengeCodeIOS
//
//  Created by mac on 04/01/2018.
//  Copyright © 2018 mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{
  
    
    final let urlString = "https://api.github.com/search/repositories?q=created:%3E2017-10-22&sort=stars&order=desc"
    
    @IBOutlet weak var tableView: UITableView!
    
    // declaration des variables qui va contenir les tableaux des données JSON
    
    var nameArray = [String]()
    var desArray = [Any?]()
    var loginArray = [String]()
    var startArray = [Double]()
    var imgURLArray = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // a le recharegement de l'application la fonction DownloadJSonWithURL() va executer
        self.downloadJsonWithURL()
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
        
        // pour traiter le cas de description = null
        if let Description = self.desArray[indexPath.row] as? String{
            vc.desString = Description
                }else{
                vc.desString = " pas de description "
        }
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    // la fonction qui va étre charger de remplir les tableaux qu'on declarer precedement apartir de URL
    func downloadJsonWithURL() {
        let url = NSURL(string: urlString)
        URLSession.shared.dataTask(with: (url as URL?)!, completionHandler: {(data, response, error) -> Void in
            
            if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                
                // result console
                print(jsonObj!.value(forKey: "items")!)
                
                
                if let RepoArray = jsonObj!.value(forKey: "items") as? NSArray {
                    
                    for repo in RepoArray{
                        
                        if let RepoDict = repo as? NSDictionary {
                            if let name = RepoDict.value(forKey: "name") {
                                self.nameArray.append(name as! String)
                            }
                            
                            if let name = RepoDict.value(forKey: "description") {
                                self.desArray.append(name)
                            }
                            if let name = RepoDict.value(forKey: "stargazers_count") as? Double{
                                let k = name / 1000
                                self.startArray.append(k)
                            }
                            
                            if let name = RepoDict.value(forKey: "owner") as? NSDictionary  {
                                self.loginArray.append(name.value(forKey: "login") as! String)
                            }
                            
                            if let name = RepoDict.value(forKey: "owner") as? NSDictionary  {
                                self.imgURLArray.append(name.value(forKey: "avatar_url") as! String)
                            }
                            
                        }
                    }
                }
                
                OperationQueue.main.addOperation({
                    self.tableView.reloadData()
                })
            }
        }).resume()
    }
    
    
    
}







