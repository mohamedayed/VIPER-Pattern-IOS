//
//  TeamsInteractor.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import Foundation

class TeamsInteractor:TeamsInteractorInputProtocol{
    private let teamsWorker = TeamsWorker()
    var presenter: TeamsInteractorOutputProtocol?
    
    func fetchTeams(){
        print("fetch Teams")
        teamsWorker.getTeams(url: NetworkConstants.baseUrl+"/competitions/PL/teams") { (error:Error?, teams:TeamsResponse?) in

            if let error = error{
                print("error\(error)")
                self.presenter?.teamsFetchedFailed(with: error)
            }else{
                print("msgError")
                guard let teamsData = teams else{return}
                self.presenter?.teamsFetchedSuccessfully(teams: teamsData.teams)
            }

        }
    }
    
}
