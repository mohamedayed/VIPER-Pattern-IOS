//
//  API.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import Foundation
import Alamofire
import Combine
var teamsBag = Set<AnyCancellable>()

class TeamsWorker{
    class func headers() -> HTTPHeaders {
        let headers: HTTPHeaders = [
            "Accept-Language":"en",
            "Content-Type": "application/json",
            "Accept": "application/json",
            "X-Auth-Token":NetworkConstants.apiKey
        ]
        
       
        
        return headers
    }
    
     func getTeams(url:String,completion:@escaping (_ error:Error?,_ teamsRe:TeamsResponse?)->Void){
        
        
       // print("URl \(url)")
        let decoder: JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
    
        
        
        AF.request(url, method: .get, parameters: nil, encoding:URLEncoding.default, headers: TeamsWorker.headers()).debugLog()
             .publishDecodable(type:TeamsResponse.self)
             .sink { completionSink in
                 switch completionSink{
                 
                 case .finished:
                     ()
                     
                 case .failure(let error):
                 print(error.localizedDescription)
                 
                 
                 }
                 
                 
                 
             } receiveValue: { response in
               // debugPrint(response)
                 switch response.result{
                 
                 case .success(let teams):
                     debugPrint(teams)

                     
                    completion(nil,teams)
                     
                 case .failure(let error):
                    print(error.errorDescription)
                     completion(error,nil)
                 
                  
                 }
                 
                 
             }.store(in: &teamsBag)

         
    
     }
    
    
    class func getTeamDetail(url:String,completion:@escaping (_ error:Error?,_ team:Teams?)->Void){
        
        
      
        
        
        AF.request(url, method: .get, parameters: nil, encoding:URLEncoding.default, headers: TeamsWorker.headers()).debugLog()
             .publishDecodable(type:Teams.self)
             .sink { completionSink in
                 switch completionSink{
                 
                 case .finished:
                     ()
                     
                 case .failure(let error):
                 print(error.localizedDescription)
                 
                 
                 }
                 
                 
                 
             } receiveValue: { response in
               // debugPrint(response)
                 switch response.result{
                 
                 case .success(let teams):
                     debugPrint(teams)
                    completion(nil,teams)
                     
                 case .failure(let error):
                    print(error.errorDescription)
                     completion(error,nil)
                 
                  
                 }
                 
                 
             }.store(in: &teamsBag)

         
    
     }
        
    
    
  
    
    
    
}
