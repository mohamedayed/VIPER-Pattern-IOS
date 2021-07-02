//
//  extenstions+AFRequest.swift
//  FootballViperPattern
//
//  Created by mohamed ayed on 7/2/21.
//

import Foundation
import Alamofire

extension Request {
    public func debugLog() -> Self {
        #if DEBUG
        debugPrint("=======================================")
        debugPrint(self)
        debugPrint("=======================================")
        #endif
        return self
    }
}

