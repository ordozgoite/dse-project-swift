//
//  DashboardScreen.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 12/06/24.
//

import SwiftUI

struct DashboardScreen: View {
    
    @StateObject private var dashboardVM = DashboardViewModel()
    @StateObject private var notificationManager = NotificationManager()
    
    @State private var isPressing = false
    @State private var progress: CGFloat = 0.0
    @State private var buttonColorStart = Color.blue
    @State private var buttonColorEnd = Color.green
    
    var body: some View {
        NavigationStack {
            VStack {
                if dashboardVM.isLoading {
                    ProgressView()
                } else {
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
                    
                    HoldDownButton(
                        text: "Open Door",
                        background: .blue,
                        loadingTint: .white.opacity(0.3)
                    ) {
                        Task {
                            await dashboardVM.openDoor()
                        }
                    }
                    .padding(.bottom)
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
