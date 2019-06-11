//
//  SecondViewController.swift
//  SingleLineParsingDemo
//
//  Created by Kondya on 11/06/19.
//  Copyright © 2019 Kondya. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    
    @IBOutlet weak var playerListTableView: UITableView!
    
    var playerList : [Player] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUP()
    }
    func setUP(){
        self.playerListTableView.delegate = self
        self.playerListTableView.dataSource = self
        self.playerListTableView.reloadData()
    }
    
}

extension SecondViewController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.playerList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = self.playerListTableView.dequeueReusableCell(withIdentifier: "CountryTableViewCell") as? CountryTableViewCell {
            cell.countryNameLbl.text = self.playerList[indexPath.row].name
            if self.playerList[indexPath.row].captain {
                cell.backgroundColor = .green
            }else{
                cell.backgroundColor = .white
            }
            return cell
            
        }
        else{
            return UITableViewCell()
        }
    }
}


