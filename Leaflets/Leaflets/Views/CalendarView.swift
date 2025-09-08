//
//  CalendarView.swift
//  Leaflets
//
//  Created by Maddy Foley on 9/8/25.
//

import SwiftUI
import SwiftData


struct CalendarView: View {
    @Environment(\.modelContext) var modelContext
    
    var calendar = Calendar(identifier: .gregorian)
    @Query var events: [Event]
    @State var date = Date()
    @State private var dates: Set<DateComponents> = []
    @State var selectedDate: DateComponents?
    
    var body: some View {
        VStack{
          
        Form {
            Section("Event Calendar"){
                MultiDatePicker("Dates Available", selection: $dates)
            }
            if !dates.isEmpty{
                Button("Save"){
                    addEvents()
                }
            }
        }
                    
        VStack{
            ForEach(events, id: \.self){ event in
                Text(event.name)
            }
            }
        }
    }
    
    func addEvents() {
        for d in dates{
            if d.isValidDate{
                let event = Event("test",eventDate: d.date!)
                modelContext.insert(event)
                try? modelContext.save()
            }
        }
    }
}


#Preview {
    CalendarView()
        .modelContainer(for: Event.self, inMemory: true)
}
