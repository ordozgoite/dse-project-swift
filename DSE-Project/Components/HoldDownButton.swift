//
//  HoldDownButton.swift
//  HoldDownView
//
//  Created by Balaji Venkatesh on 19/03/24.
//

import SwiftUI

struct HoldDownButton: View {
    /// Config
    var text: String
    var paddingHorizontal: CGFloat = 100
//    var paddingVertical: CGFloat = 64
    var duration: CGFloat = 1
    var scale: CGFloat = 0.95
    var background: Color
    var loadingTint: Color
//    var shape: AnyShape = .init(.rect(cornerRadii: RectangleCornerRadii()))
    var action: () -> ()
    /// View Properties
    @State private var timer = Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()
    @State private var timerCount: CGFloat = 0
    @State private var progress: CGFloat = 0
    @State private var isHolding: Bool = false
    @State private var isCompleted: Bool = false
    var body: some View {
        Text(text)
            .foregroundStyle(.white)
            .font(.title2)
            .fontWeight(.bold)
//            .padding(.vertical, paddingVertical)
            .padding(.horizontal, paddingHorizontal)
            .background {
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(background.gradient)
                        .frame(height: 64)
                    
                    GeometryReader {
                        let size = $0.size
                        /// Adding Opacity Transition
                        if !isCompleted {
                            RoundedRectangle(cornerRadius: 20)
                                .fill(loadingTint)
                                .frame(width: size.width * progress)
                                .transition(.opacity)
                        }
                    }
                }
            }
//            .clipShape(shape)
//            .contentShape(shape)
            .scaleEffect(isHolding ? scale : 1)
            .animation(.snappy, value: isHolding)
            /// Gestures
            .gesture(longPressGesture)
            .simultaneousGesture(dragGesture)
            /// Timer
            .onReceive(timer) { _ in
                if isHolding && progress != 1 {
                    timerCount += 0.01
                    progress = max(min(timerCount / duration, 1), 0)
                }
            }
            .onAppear(perform: cancelTimer)
    }
    
    var dragGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onEnded { _ in
                guard !isCompleted else { return }
                cancelTimer()
                withAnimation(.snappy) { reset() }
            }
    }
    
    var longPressGesture: some Gesture {
        LongPressGesture(minimumDuration: duration)
            .onChanged {
                /// Resetting to initial State
                isCompleted = false
                reset()
                
                isHolding = $0
                addTimer()
            }.onEnded { status in
                isHolding = false
                cancelTimer()
                withAnimation(.easeInOut(duration: 0.2)) { isCompleted = status }
                action()
            }
    }
    
    /// Adds Timer
    func addTimer() {
        timer = Timer.publish(every: 0.01, on: .current, in: .common).autoconnect()
    }
    
    /// Cancels Timer
    func cancelTimer() {
        timer.upstream.connect().cancel()
    }
    
    /// Reset to initial state
    func reset() {
        isHolding = false
        progress = 0
        timerCount = 0
    }
}
