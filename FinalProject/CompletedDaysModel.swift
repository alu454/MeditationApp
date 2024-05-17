//
//  CompletedDaysModel.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//

import Foundation
import Combine

class CompletedDaysModel: ObservableObject {
    @Published var completedDays: [Date] = []

//    init() {
//        // Adding May 1st, 2024 for testing
//        if let testDate = Calendar.current.date(from: DateComponents(year: 2024, month: 5, day: 1)) {
//            completedDays.append(testDate)
//        }
//    }

    //adds data to model
    func addCompletedDay(_ date: Date) {
        let startOfDay = Calendar.current.startOfDay(for: date)
        if !completedDays.contains(where: { Calendar.current.isDate($0, inSameDayAs: startOfDay) }) {
            completedDays.append(startOfDay)
        }
    }
}

