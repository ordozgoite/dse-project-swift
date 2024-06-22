//
//  DSEEndpoints.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 14/06/24.
//

import Foundation

enum DSEEndpoints {
    case getAllRecognitionAttempts
    case openDoor
}

extension DSEEndpoints: Endpoint {
    
    //MARK: - URL
    
    var path: String {
        switch self{
        case .getAllRecognitionAttempts:
            return "/api/RecognitionAttempt/GetAllRecognitionAttempts"
        case .openDoor:
            return "/api/RecognitionAttempt/OpenDoor"
        }
    }
    
    //MARK: - Method
    
    var method: RequestMethod {
        switch self {
        case .getAllRecognitionAttempts:
            return .get
        case .openDoor:
            return .post
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
        case .getAllRecognitionAttempts, .openDoor:
            return nil
        }
    }
}

