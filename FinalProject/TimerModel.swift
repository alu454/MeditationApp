//
//  TimerModel.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//
import Foundation
import Combine

// creating states for timer
enum TimerState {
    case running, paused, finished
}

class TimerModel: ObservableObject {
    // create variables needed for timer
    @Published var timeRemaining: Int
    @Published var state: TimerState = .paused
    public let totalTime: Int
    var timer: Timer?
    var completedDaysModel: CompletedDaysModel

    init(time: Int, completedDaysModel: CompletedDaysModel) {
        self.timeRemaining = time
        self.totalTime = time
        self.completedDaysModel = completedDaysModel
    }

    // starts timer, and includes debug statements
    func start() {
        if timeRemaining > 0 {
            state = .running
            print("Timer started")
            timer?.invalidate()
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [weak self] _ in
                self?.tick()
            }
        } else {
            print("Timer not started: timeRemaining is zero or less")
        }
    }

    // default timer functions
    func pause() {
        state = .paused
        print("Timer paused")
        timer?.invalidate()
    }

    func reset() {
        timer?.invalidate()
        timeRemaining = totalTime
        state = .paused
        print("Timer reset")
    }

    // timer function that decrements time
    private func tick() {
        if timeRemaining > 0 {
            timeRemaining -= 1
            print("Time remaining: \(timeRemaining)")
        } else {
            timer?.invalidate()
            state = .finished
            print("Timer finished")
            let completedDate = Calendar.current.startOfDay(for: Date())
            completedDaysModel.addCompletedDay(completedDate)
            print("Completed days updated: \(completedDaysModel.completedDays)")
        }
    }
}
