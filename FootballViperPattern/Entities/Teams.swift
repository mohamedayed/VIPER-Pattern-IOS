//
//  Teams.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import Foundation
import Kingfisher
struct TeamsResponse :Decodable{
    let teams:[Teams]
}


struct Teams:Decodable{
//    let id: Int
//    let name, shortName, tla: String
//    let crestURL: String?
//    let address, phone: String
//    let website: String
//    let email: String?
//    let founded: Int
//    let clubColors: String
//    let venue: String?
//    let lastUpdated: Date

    //let id: Int
    let name:String
    let founded: Int
    
    
}


struct TeamsViewModel{
    var teamName:String
    var founded:String
    var teamImage:URL?
    init(teams:Teams) {
        teamName = teams.name
        founded = "Since: \(teams.founded)"
        teamImage = URL(string:"https://via.placeholder.com/150" ?? "")
            
           }
    
    
}
