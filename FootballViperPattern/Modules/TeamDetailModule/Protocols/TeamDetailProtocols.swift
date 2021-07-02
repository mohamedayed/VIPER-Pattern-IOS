//
//  TeamDetailProtocols.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import UIKit
protocol TeamsDetailViewProtocol:class{
    
    var presenter:TeamsDetailPresenterProtocol! {get set}
    func showIndicator()
    func hideIndicator()
    func showDetail(teamItem:Teams)
    
    
    
}

protocol TeamsDetailPresenterProtocol:class{
    
    var view:TeamsDetailViewProtocol? {get set}
    func ViewDidLoad()
    var testCount:Int {get}

    
}


protocol TeamsDetailRouterProtocol{
 
    static func createDetailRouterModule(with team: Teams) -> UIViewController
   // func pushToDetailsScreen(navigationController:UINavigationController)
}

protocol TeamsDetailInteractorInputProtocol{
    
   // var presenter: TodoDetailInteractorOutputProtocol? { get set }
    var teamItem: Teams? { get set }
    
    //func fetchTeams()
    
}

protocol TeamsDetailInteractorOutputProtocol {
//    func teamsFetchedSuccessfully(teams:[Teams])
//    func teamsFetchedFailed(with error:Error)
    
}


protocol teamsDetailCellProtocol{
    
    func configureCell(viewModel:TeamsViewModel)
    
}
