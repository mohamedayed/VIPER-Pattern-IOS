//
//  TeamsDetailRouter.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import UIKit
class TeamsDetailRouter : TeamsDetailRouterProtocol{
    
    
    weak var teamsDetailVC:UIViewController?
   static func createDetailRouterModule(with team: Teams) -> UIViewController{
    let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(DetailTableViewController.self)") as! DetailTableViewController
        
        let interactor = TeamDetailInteractor()
        
        let router = TeamsDetailRouter()
        
        //Dependency Injection
    
        let presenter = TeamDetailPresenter(view: view, interactor: interactor, router: router)
        
        //field injection part
        
        view.presenter = presenter
        interactor.teamItem = team
        interactor.presenter = presenter
        router.teamsDetailVC = view
        
        print("\(view)DHView")
        return view
        
    
     
    
    }
    static var storyboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    
    
    
    
}
