//
//  RecognitionAttempt.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 12/06/24.
//

import Foundation

struct RecognitionAttempt: Codable, Identifiable {
    enum AttemptResult: Codable {
        case allowed
        case denied
    }
    
    let id: String
    let timestamp: Int
    let result: String
    let username: String?
    
    var attemptResult: AttemptResult {
        return switch result {
        case "allowed":
                .allowed
        case "denied":
                .denied
        default:
                .denied
        }
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case timestamp
        case result
        case username
    }
}
