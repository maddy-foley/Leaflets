//
//  EventModel.swift
//  Leaflets
//
//  Created by Maddy Foley on 9/8/25.
//
import Foundation
import SwiftData
import SwiftUI

@Model
class Event: Identifiable, Hashable {
    @Attribute(.unique) var id: UUID
    var name: String
    var systemImage: String
    var eventDate: Date
    var notes: String?
    
    
    init(_ name: String, eventDate: Date, systemImage: String = "circle"){
        self.id = UUID()
        self.name = name
        self.eventDate = eventDate
        self.systemImage = systemImage

    }
    
    init(_ name: String, eventDate: Date, systemImage: String = "circle", notes: String?){
        self.id = UUID()
        self.name = name
        self.eventDate = eventDate
        self.systemImage = systemImage
        self.notes = notes
    }
}
