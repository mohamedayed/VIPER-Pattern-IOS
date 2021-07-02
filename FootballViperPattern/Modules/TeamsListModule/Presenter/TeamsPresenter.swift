//
//  TeamsPresenter.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import Foundation

class TeamsPrsenter:TeamsPresenterProtocol,TeamsInteractorOutputProtocol{
 
    
    weak var view:TeamsViewProtocol?
    
    private let interactor:TeamsInteractorInputProtocol
    
    private let router:TeamsRouterProtocol
    
    private var teams = [Teams]()
    
    
    init(view:TeamsViewProtocol,interactor:TeamsInteractorInputProtocol,router:TeamsRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        
    }
    
  
    
    func ViewDidLoad() {
        print("indicator")
        view?.showIndicator()
        interactor.fetchTeams()
        
    }
    
    func showTeamDetail(_ team: Teams) {
        //guard let view = view else { return }
        print("\(team)rana")
        
        router.presentDetailScreen(from : view!, for : team)
    }
    
    func teamsFetchedSuccessfully(teams: [Teams]) {
        view?.hideIndicator()
        self.teams.append(contentsOf: teams)
        view?.reloadData()
        
    }
    
    func teamsFetchedFailed(with error: Error) {
        view?.hideIndicator()
        print("show error message")
    }
    
    
    var teamsList:[Teams]{
        return self.teams
    }
    
    var teamsNumRows: Int{
        return self.teams.count
    
    }
    func configure(cell: TeamCell, indexPath: IndexPath) {
        let team = teams[indexPath.row]
        let teamsViewModel = TeamsViewModel(teams: team)
        cell.configureCell(viewModel: teamsViewModel)
    }
    
}
