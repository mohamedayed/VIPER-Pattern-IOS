//
//  DetailTableViewController.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import UIKit

class DetailTableViewController: UITableViewController ,TeamsDetailViewProtocol{
    func showIndicator() {
        
    }
    
    func hideIndicator() {
        
    }
    
    var id:Int = 0
    var presenter: TeamsDetailPresenterProtocol!

    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var teamFounded:UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let presenter  = presenter{
            presenter.ViewDidLoad()
        }
        print("\(presenter.testCount)testCount")
        setUpView()
    }
    
    func setUpView(){
        tableView.tableFooterView = UIView()

    }
    

    func showDetail(teamItem:Teams){

        teamName.text = teamItem.name
        teamFounded.text = "\(teamItem.founded)"
        
    }
    

    // MARK: - Table view data source

}
