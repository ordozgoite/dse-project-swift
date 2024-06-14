//
//  DashboardScreen.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 12/06/24.
//

import SwiftUI

struct DashboardScreen: View {
    
    @StateObject private var dashboardVM = DashboardViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(dashboardVM.attempts) { attempt in
                    VStack(alignment: .leading) {
                        HStack {
                            Circle()
                                .frame(width: 8, height: 8, alignment: .center)
                                .foregroundStyle(attempt.attemptResult == .allowed ? .green : .red)
                            
                            Text(attempt.username ?? "Unknown")
                                .bold()
                        }
                        
                        Text(attempt.timestamp.convertTimestampToDate().formatDateToString())
                            .foregroundStyle(.gray)
                            .padding(.leading)
                    }
                }
            }
            
            .navigationTitle("Dashboard")
        }
        .task {
            await dashboardVM.getAttempts()
        }
    }
}

#Preview {
    DashboardScreen()
}
