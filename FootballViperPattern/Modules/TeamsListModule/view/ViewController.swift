//
//  ViewController.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import UIKit
import SVProgressHUD
class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource ,TeamsViewProtocol{
   
    
    var presenter: TeamsPresenterProtocol!
    
    
    
    @IBOutlet weak var teamsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        presenter.ViewDidLoad()
        
    }
    
    
    private func setUpTableView(){
        teamsTableView.dataSource = self
        teamsTableView.delegate = self
       
    }
    
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
            return presenter.teamsNumRows
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let team = presenter.teamsList[indexPath.row]
        print("\(team.name)hena")
        
        presenter.showTeamDetail(team)
        
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TeamCell", for: indexPath) as! TeamCell
        
       presenter.configure(cell: cell, indexPath: indexPath)
        
        //cell.configure(team: team)
        return cell
    }
    
    func showIndicator() {
        SVProgressHUD.show()
    }
    
    func hideIndicator() {
        SVProgressHUD.dismiss()
    }
    
    func reloadData() {
        teamsTableView.reloadData()
    }
    

}

