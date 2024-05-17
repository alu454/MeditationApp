//
//  ConsistencyTrackingPage.swift
//  FinalProject
//
//  Created by Alan Lu on 5/17/24.
//
import SwiftUI

struct ConsistencyTrackingPage: View {
    @ObservedObject var completedDaysModel: CompletedDaysModel

    var body: some View {
        
        // instantiates calendar and updates ui on data
        VStack {
            Text("Consistency Tracker")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            CalendarView(completedDays: $completedDaysModel.completedDays)
                .frame(height: 400)
                .padding()
        }
        .onAppear {
            // Refresh the UI when the view appears
            completedDaysModel.objectWillChange.send()
        }
        .navigationTitle("Progress")
    }
}

struct ConsistencyTrackingPage_Previews: PreviewProvider {
    static var previews: some View {
        ConsistencyTrackingPage(completedDaysModel: CompletedDaysModel())
    }
}
