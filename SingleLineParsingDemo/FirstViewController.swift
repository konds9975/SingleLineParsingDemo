//
//  ViewController.swift
//  SingleLineParsingDemo
//
//  Created by Kondya on 11/06/19.
//  Copyright © 2019 Kondya. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    
    @IBOutlet weak var countryListTableView: UITableView!
    
    var countryList : [Country] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setUP()
    
        
    }
    func setUP(){
        
        self.countryListTableView.delegate = self
        self.countryListTableView.dataSource = self
        loadJsonFromUrl()
        
    }
    
}

extension FirstViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.countryList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = self.countryListTableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as? CountryTableViewCell {
            cell.countryNameLbl.text = self.countryList[indexPath.row].name
            return cell
            
        }
        else{
            return UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc  = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        vc.playerList = self.countryList[indexPath.row].playerArray
        print(self.countryList[indexPath.row].playerArray)
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    func loadJsonFromUrl()  {
        guard let gitUrl = URL(string: "http://test.oye.direct/players.json") else { return }
        URLSession.shared.dataTask(with: gitUrl) { (data, response
            , error) in
            guard let data = data else { return }
            do {
                
               let json = try JSONSerialization.jsonObject(with: data, options: []) as! NSDictionary
                for (key, array) in json {
                    
                    let temp = Country()
                    temp.name = key as? String ?? ""
                    var playerList = [Player]()
                    if let arrayofplayer = array as? Array<NSDictionary> {
                        for dic in arrayofplayer {
                            let tempPlayer = Player()
                            tempPlayer.name = dic.value(forKey: "name") as? String ?? ""
                            tempPlayer.captain = dic.value(forKey: "captain") as? Bool ?? false
                            playerList.append(tempPlayer)
                        }
                        temp.playerArray = playerList
                    }
                    self.countryList.append(temp)
                }
                DispatchQueue.main.async {
                   self.countryListTableView.reloadData()
                }
            } catch let err {
                print("Err", err)
            }
            }.resume()
    }
    
}


