//
//  EventViewModel.swift
//  Leaflets
//
//  Created by Maddy Foley on 9/8/25.
//
import SwiftUI
import SwiftData




@Observable
class EventModelView {
    var name: String
    var systemImage: String
    var eventDate: Date
    var notes: String?
    
    init(_ name: String, eventDate: Date, systemImage: String = "circle"){

        self.name = name
        self.eventDate = eventDate
        self.systemImage = systemImage

    }
    
    init(_ name: String, eventDate: Date, systemImage: String = "circle", notes: String?){
 
        self.name = name
        self.eventDate = eventDate
        self.systemImage = systemImage
        self.notes = notes
    }
}

@Observable
class EventsModelView: Identifiable {
    var dateComponents: [DateComponents] = []
    var selected: Date?
    
    init(_ events: [Event] = []){
        for event in events {
            self.dateComponents.append(buildDateComponent(event))
        }
    }
    
    func buildDateComponent(_ event: Event) -> DateComponents {
        var dateComponents: DateComponents {
          var dateComponents = Calendar.current.dateComponents(
              [.month,
               .day,
               .year,
               .hour,
               .minute],
              from: event.eventDate)
          dateComponents.timeZone = TimeZone.current
          dateComponents.calendar = Calendar(identifier: .gregorian)
          return dateComponents
      }
    
        return dateComponents
    }
}
