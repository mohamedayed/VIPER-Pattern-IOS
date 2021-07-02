//
//  TeamsProtocolos.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import UIKit


protocol TeamsViewProtocol:class{
    
    var presenter:TeamsPresenterProtocol! {get set}
    func showIndicator()
    func hideIndicator()
    func reloadData()
    
    
}

protocol TeamsPresenterProtocol:class{
    
    var view:TeamsViewProtocol? {get set}
    func ViewDidLoad()
    var teamsNumRows:Int {get}
    var teamsList:[Teams] {get}
    func configure(cell:TeamCell,indexPath:IndexPath)
    func showTeamDetail(_ team: Teams)
   // func showTeamDetail(with team:Teams)
}


protocol TeamsRouterProtocol{
    static func initModule()->UIViewController
    
    func presentDetailScreen(from view: TeamsViewProtocol, for team: Teams)
    //func pushToDetailsScreen(navigationController:UINavigationController)
}

protocol TeamsInteractorInputProtocol{
    
    var presenter:TeamsInteractorOutputProtocol? {get set}
    func fetchTeams()
    
}

protocol TeamsInteractorOutputProtocol {
    func teamsFetchedSuccessfully(teams:[Teams])
    func teamsFetchedFailed(with error:Error)
    
}


protocol teamsCellProtocol{
    
    func configureCell(viewModel:TeamsViewModel)
    
}
