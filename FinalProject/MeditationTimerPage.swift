//
//  MeditationTimerPage.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//
import SwiftUI

struct MeditationTimerPage: View {
    @ObservedObject private var completedDaysModel = CompletedDaysModel()
    @StateObject private var timerModel: TimerModel

    //sets up timer and connects to model that stores data
    init(completedDaysModel: CompletedDaysModel) {
        self.completedDaysModel = completedDaysModel
        _timerModel = StateObject(wrappedValue: TimerModel(time: 600, completedDaysModel: completedDaysModel)) // Default to 10 minutes
    }
    
    var body: some View {
        
        //visuals of the timer
        VStack {
            Text("Meditation Timer")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            ZStack {
                // Background Circle
                Circle()
                    .stroke(lineWidth: 10.0) // Thinner line width
                    .opacity(0.3)
                    .foregroundColor(.gray)
                
                // Progress Circle
                Circle()
                    .trim(from: 0.0, to: 1.0 - progress)
                    .stroke(style: StrokeStyle(lineWidth: 10.0, lineCap: .round, lineJoin: .round)) // Thinner line width
                    .foregroundColor(.black)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear, value: progress)
                
                // Timer Text
                Text(timeString(from: timerModel.timeRemaining))
                    .font(.system(size: 48, weight: .bold, design: .monospaced))
            }
            .frame(width: 250, height: 250) // Bigger circle
            .padding(.bottom, 20)
            
            //button that changes states based on what the timer is doing
            //button changes look and action
            Button(action: {
                switch timerModel.state {
                case .running:
                    timerModel.pause()
                case .paused:
                    timerModel.start()
                case .finished:
                    timerModel.reset()
                }
            }) {
                Text(buttonTitle(for: timerModel.state))
                    .font(.title2) // Smaller text size
                    .padding()
                    .background(buttonColor(for: timerModel.state).opacity(0.2)) // Less color emphasis
                    .foregroundColor(.black) // Less color emphasis
                    .cornerRadius(10)
            }
        }
        .padding()
        .environmentObject(completedDaysModel)
    }
    
    //extra functions for timer visuals
    //to see completion rate of timer
    private var progress: CGFloat {
        return CGFloat(timerModel.timeRemaining) / CGFloat(timerModel.totalTime)
    }
    
    //calculate string of timer
    private func timeString(from seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    //calculate text on button
    private func buttonTitle(for state: TimerState) -> String {
        switch state {
        case .running:
            return "Pause"
        case .paused:
            return "Start"
        case .finished:
            return "Reset"
        }
    }
    
    //calculate color of button
    private func buttonColor(for state: TimerState) -> Color {
        switch state {
        case .running:
            return .yellow
        case .paused:
            return .green
        case .finished:
            return .red
        }
    }
}

//struct MeditationTimerPage_Previews: PreviewProvider {
//    static var previews: some View {
//        MeditationTimerPage(completedDaysModel: CompletedDaysModel)
//    }
//}
//
//
//#Preview {
//    MeditationTimerPage(completedDaysModel: CompletedDaysModel)
//}
