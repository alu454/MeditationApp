import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    @Binding var completedDays: [Date]

    class Coordinator: NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarView

        init(parent: CalendarView) {
            self.parent = parent
        }
        
        //adds dot/event to date if date is in completed data
        func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
            // Flag to indicate if any event is found for the given date
            var hasEvent = false
            
            // Iterate over every completed date
            parent.completedDays.forEach { completedDate in
                // Check if the completedDate is in the same day as the provided date
                if Calendar.current.isDate(completedDate, inSameDayAs: date) {
                    // Print a message if there's an event for the date
                    print("Event for date: \(date)")
                    // Set the flag to true indicating an event is found
                    hasEvent = true
                }
            }
            
            // Return 1 if an event is found, otherwise return 0
            return hasEvent ? 1 : 0
        }

        func calendar(_ calendar: FSCalendar, appearance: FSCalendarAppearance, titleDefaultColorFor date: Date) -> UIColor? {
            return UIColor.label // Adjusts to dark and light mode
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIView(context: Context) -> FSCalendar {
        
        //customizing visuals of calendar
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator

        // Customize appearance
        calendar.appearance.selectionColor = .clear // Remove blue highlight
        calendar.appearance.todayColor = .clear // Remove highlight for today
        calendar.appearance.titleTodayColor = UIColor.label // Adjusts to dark and light mode
        calendar.appearance.eventDefaultColor = UIColor.systemBlue // Color for the event dots
        calendar.appearance.eventSelectionColor = UIColor.systemBlue // Color for the event dots when selected

        calendar.appearance.titleDefaultColor = UIColor.label // Adjusts to dark and light mode
        calendar.appearance.titleSelectionColor = UIColor.label // Adjusts to dark and light mode
        
        // Enable month traversal
        calendar.scrollDirection = .horizontal
        calendar.scope = .month
        calendar.headerHeight = 40
        calendar.appearance.headerDateFormat = "MMMM yyyy"
        calendar.appearance.headerTitleColor = UIColor.label // Adjusts to dark and light mode
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 18)
        calendar.appearance.weekdayTextColor = UIColor.label // Adjusts to dark and light mode

        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {
        uiView.reloadData()
    }
}
