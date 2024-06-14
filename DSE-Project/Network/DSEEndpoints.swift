//
//  DSEEndpoints.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 14/06/24.
//

import Foundation

enum DSEEndpoints {
    case getAllRecognitionAttempts
}

extension DSEEndpoints: Endpoint {
    
    //MARK: - URL
    
    var path: String {
        switch self{
        case .getAllRecognitionAttempts:
            return "/api/RecognitionAttempt/GetAllRecognitionAttempts"
        }
    }
    
    //MARK: - Method
    
    var method: RequestMethod {
        switch self {
        case .getAllRecognitionAttempts:
            return .get
        }
    }
    
    //MARK: - Query
    
    var query: [String: Any]? {
        switch self {
        default:
            return nil
        }
    }
    
    //MARK: - Header
    
    var header: [String : String]? {
        switch self {
        default:
            return [
                "Accept": "application/x-www-form-urlencoded",
                "Content-Type": "application/json"
            ]
        }
    }
    
    //MARK: - Body
    
    var body: [String : Any]? {
        switch self {
        case .getAllRecognitionAttempts:
            return nil
        }
    }
}

