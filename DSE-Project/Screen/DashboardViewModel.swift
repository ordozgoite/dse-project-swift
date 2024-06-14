//
//  DashboardViewModel.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 14/06/24.
//

import Foundation

//RecognitionAttempt(id: "1", timestamp: 1718219565, result: "allowed", username: "Afonso Neto"),
//RecognitionAttempt(id: "2", timestamp: 1718129465, result: "allowed", username: "Sabrina Millane"),
//RecognitionAttempt(id: "3", timestamp: 1718099465, result: "denied", username: nil),
//RecognitionAttempt(id: "4", timestamp: 1718079465, result: "allowed", username: "Victor Ordozgoite"),
//RecognitionAttempt(id: "5", timestamp: 1718049465, result: "denied", username: nil),
//RecognitionAttempt(id: "6", timestamp: 1718029465, result: "allowed", username: "Adria Castro"),
//RecognitionAttempt(id: "7", timestamp: 1718009465, result: "allowed", username: "Alexandre Ferreira")

@MainActor
class DashboardViewModel: ObservableObject {
    
    @Published var attempts: [RecognitionAttempt] = []
    
    func getAttempts() async {
        let result = await DSEServices.shared.getAllRecognitionAttempts()
        
        switch result {
        case .success(let attempts):
            self.attempts = attempts
        case .failure(let error):
            print("❌ Error trying to fetch attempts: \(error)")
        }
    }
}
