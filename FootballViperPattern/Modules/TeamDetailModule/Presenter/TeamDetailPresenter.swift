//
//  TeamDetailPresenter.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import Foundation


class TeamDetailPresenter:TeamsDetailPresenterProtocol,TeamsDetailInteractorOutputProtocol{

   
    
    
    weak var view:TeamsDetailViewProtocol?
    
    private let interactor:TeamsDetailInteractorInputProtocol
    
    private let router:TeamsDetailRouterProtocol
    
    
    
    
    init(view:TeamsDetailViewProtocol,interactor:TeamsDetailInteractorInputProtocol,router:TeamsDetailRouterProtocol) {
        self.view = view
        self.router = router
        self.interactor = interactor
        print("Init Done")
    }
    
    
    var testCount:Int{
        return 5
    }
    func ViewDidLoad() {
        if let teamData = interactor.teamItem {
            view?.showDetail(teamItem:teamData)

        }
        
    }
    
    

    
    
    
    
    
  
    
    
    
    
}
