//
//  TestScreen.swift
//  DSE-Project
//
//  Created by Victor Ordozgoite on 18/06/24.
//

import SwiftUI

import SwiftUI

struct TestScreen: View {
    @State private var isPressed = false
    @State private var progress: CGFloat = 0
    @State private var timer: Timer?

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.blue)
                .frame(width: 200, height: 50)
                .overlay(
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color.green)
                            .frame(width: self.progress * geometry.size.width, height: geometry.size.height)
                            .clipped()
                            .animation(.linear(duration: 2), value: progress)
                    }
                )
                .gesture(
                    LongPressGesture(minimumDuration: 2)
                        .onChanged { _ in
                            self.isPressed = true
                            self.startTimer()
                        }
                        .onEnded { _ in
                            self.isPressed = false
                            self.timer?.invalidate()
                            self.timer = nil
                            if self.progress >= 1.0 {
                                self.executeFunction()
                            }
                            self.progress = 0
                        }
                )
        }
    }

    private func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            if self.progress < 1.0 {
                self.progress += 0.01 / 2.0 // 0.01 second intervals, complete in 2 seconds
            }
        }
    }

    private func executeFunction() {
        print("Function executed after 2 seconds")
        // Coloque aqui a função que você deseja executar após 2 segundos
    }
}

#Preview {
    TestScreen()
}

