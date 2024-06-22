//
//  DSEServices.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 14/06/24.
//

import Foundation

protocol DSEServiceable {
    
    // Attempt
    func getAllRecognitionAttempts() async -> Result<[RecognitionAttempt], RequestError>
    func openDoor() async -> Result<OpenDoorResponse, RequestError>
}

struct DSEServices: HTTPClient, DSEServiceable {
    
    static let shared = DSEServices()
    private init() {}
    
    //MARK: - Attempt
    
    func getAllRecognitionAttempts() async -> Result<[RecognitionAttempt], RequestError> {
        return await sendRequest(endpoint: DSEEndpoints.getAllRecognitionAttempts, responseModel: [RecognitionAttempt].self)
    }
    
    func openDoor() async -> Result<OpenDoorResponse, RequestError> {
        return await sendRequest(endpoint: DSEEndpoints.openDoor, responseModel: OpenDoorResponse.self)
    }
}

