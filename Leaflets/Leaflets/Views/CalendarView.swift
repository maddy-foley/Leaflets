
import SwiftUI
import UIKit
import SwiftData

struct MyCalendarView: View{
    @State private var selectedDate: DateComponents?
    @Query
    var events: [EventData]
    @State var eventComponents = EventComponents()
    @State private var isLoading = true
    
    
    var body: some View{
        VStack{
            if !isLoading {
                CalendarView(interval: DateInterval(start: .distantPast, end: .distantFuture), selectedDate: $selectedDate, eventComponents: $eventComponents)
            } else {
                Text("Loading...")
            }
        }.task{
            
            eventComponents.events = events
            isLoading = false
         }
        .onChange(of: events) {
            eventComponents.events = events
            isLoading = false
        }
    }
}



struct CalendarView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    let interval: DateInterval
    
    @Binding var selectedDate: DateComponents?
    @Binding var eventComponents: EventComponents
    
    
    func makeUIView(context: Context) -> UICalendarView {
        
        let calendarView = UICalendarView()
        context.coordinator.calendarView = calendarView
        
        calendarView.delegate = context.coordinator
        calendarView.fontDesign = .rounded
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.availableDateRange = interval
        calendarView.locale = .current
        
        let dateSelection = UICalendarSelectionSingleDate(delegate: context.coordinator)
        calendarView.selectionBehavior = dateSelection
        
        return calendarView
    }
    
    
    
    func updateUIView(_ uiView: UICalendarView, context: Context) {
        if $eventComponents.events.count != context.coordinator.parent.$eventComponents.events.count {
        }
    }
    
    
    
    class Coordinator: NSObject, UICalendarViewDelegate, UICalendarSelectionSingleDateDelegate {
        
        func dateSelection(_ selection: UICalendarSelectionSingleDate, didSelectDate dateComponents: DateComponents?) {
        }
        
        var parent: CalendarView
        var calendarView: UICalendarView? = nil
        
        
        
        init(_ calendarView: CalendarView) {
            parent = calendarView
        }
        
        
        //Adds decorations to Calendar
        func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
            
            
            let targetDate = Calendar.current.date(from: dateComponents)
            
            for e in parent.eventComponents.events {
                if Calendar.current.isDate(e.date, inSameDayAs: targetDate!) {
                    return UICalendarView.Decoration.image(
                        UIImage(systemName: e.systemImageName),
                        color: .red,
                        size: .large
                    )
                }
            }
            return nil
        }
        
        func dateSelection(
            _ selection: UICalendarSelectionSingleDate,
            canSelectDate dateComponents: DateComponents?
        ) -> Bool {
            
            return dateComponents != nil
        }
    }
    
}

#Preview {
    
    
    MyCalendarView()
        .modelContainer(for: EventData.self)
}
