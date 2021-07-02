//
//  TeamsRouter.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import UIKit

class TeamsRouter : TeamsRouterProtocol{
    
    
    weak var teamsVC:UIViewController?
   static func initModule() -> UIViewController{
        
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let interactor = TeamsInteractor()
        
        let router = TeamsRouter()
        
        //Dependency Injection
    
        let presenter = TeamsPrsenter(view: view, interactor: interactor, router: router)
        
        //field injection part
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.teamsVC = view
        
        print("\(view)DHView")
        return view
        
    
     
    
    }
    
    
    func presentDetailScreen(from view: TeamsViewProtocol, for team: Teams){
        
        let teamDetailVC = TeamsDetailRouter.createDetailRouterModule(with: team)
        
        
        guard let viewVC = view as? UIViewController else {
            fatalError("Invalid View Protocol type")
        }
        
        viewVC.present(teamDetailVC, animated: true, completion: nil)
        //viewVC.navigationController?.pushViewController(teamDetailVC, animated: true)
    }
    
    
    
}
