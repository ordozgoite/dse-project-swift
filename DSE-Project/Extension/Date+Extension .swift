//
//  Date+Extension .swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 12/06/24.
//

import Foundation

extension Date {
//    func timeAgoDisplay() -> String {
//        let formatter = RelativeDateTimeFormatter()
//        formatter.unitsStyle = .abbreviated
//        return formatter.localizedString(for: self, relativeTo: Date())
//    }
//    
//    func convertDateToString() -> String {
//        let dateFormatter = DateFormatter()
//        dateFormatter.locale = Locale.current
//        dateFormatter.dateStyle = .short
//        return dateFormatter.string(from: self)
//    }
    
    func formatDateToString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm · dd/MM/yy"
        dateFormatter.locale = Locale(identifier: "pt_BR") // Define o local para exibição no formato desejado
        
        return dateFormatter.string(from: self)
    }
}
